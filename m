Return-Path: <linux-arm-msm+bounces-102761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJGaFHTk2WmBuggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:04:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF13DE814
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64CD1300E72C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 06:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C3F3112AD;
	Sat, 11 Apr 2026 06:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BETG5v7+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zos0A8ve"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7719D22D792
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775887467; cv=none; b=ozmScTOuTct2iX47GbBAmjU6PVn5HjUNtyXKzCw7Ji2p1MARH4H7Vz3QftZ9yUqainbbJcbOwXwyMjcEnox2sqLY3AEx2rQOJLHNPHy4+s8eO44hRybBA6vAjJWsTB2vtvoOlCaTi7s8IjM7UeqW/6iIrSWFd1Dq/+Mw6fvWois=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775887467; c=relaxed/simple;
	bh=leoX91N0hGjzkz7DHrAudWywmbfdQiKODCjCk+R2eo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0/isNXYB6u4HCA3aNS514pLH0jcvObySFJ9hVR3giqnZSsInNXdhPyUxMT2frmY9Kkf0d1ZcBXCgdhvpwZS49pB1t/ZowVzkGSVTqlVhIQfK5YA67JjkVVs78U+aFj+0IFuh88YMGjQb6ad8tQpk1CqzqshUyUtURsDvEj4j3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BETG5v7+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zos0A8ve; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B41XmG3377254
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vp8GIUTb40BDitATSOBzARgxQcpi+zKAPKLqD7NwSW4=; b=BETG5v7+hpuF1lOW
	AyaEK+L2c2rFdTo5PxJ4MqAjcezxfiQPWeDzMf0YmeDds5GGL8uK0HThXQr2LtVw
	XBCtGLTUPbzcLcI3CISmV7Seg2LBee0vnaRt4dh2GLNnYH+TF8hEI90KVon7Mw1m
	zSm6Yeb/x17rsRHSxxRjY1JDVs9u1FzpeDkx0LMHrFQ6o9f/+ixKrIGqgkze04Do
	JIy6GWpCdlrXJkIugBxEe2/Ar31BUNIEc1kF750OwER9CcuusgGOepQ6DogUktMN
	v/IutyX+E2EGbXjJwrchkPdIT7g2IH3D6Q8pFhPQiPB9kN6Lj4NkLnexe6+CSCIX
	wjkTHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkr66m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 06:04:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da86144daso3394117a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 23:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775887463; x=1776492263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vp8GIUTb40BDitATSOBzARgxQcpi+zKAPKLqD7NwSW4=;
        b=Zos0A8vekAaJGIk42gkAXMmoRW9AE0+gqe5RpWw31KHIRZc0Dzhv4T7q09dTo3OaVp
         X2NFUOL7aj4jewzvi2rkMLQMGWNS07tqmZCSQhcLln9W2JbHmyGkbNHNPYhmD6f8pHPS
         owsXjNo/3gQvtg9PNaGXdDZKkP6hA9vgizdyxaqIjlhMzAU1zjofOHIs+LEhV+w+uXnY
         ZUDifxOOQbFjGM0K7t7fE0fbf1qx4ilh8lNJ3SNc6qd/PxhneS3+/8fyG5/ExNkWos5y
         CAA4jFb9IgIF5icQjlmKzJPjoHTQV6YpCcFGIjczLsv3TnbIMNlq/KbRzpCMduRfq572
         DqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775887463; x=1776492263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vp8GIUTb40BDitATSOBzARgxQcpi+zKAPKLqD7NwSW4=;
        b=oOWx6q8kGldMAKCbLLm+7M5/I7TTP9kxyD5YPs5ZhzwvbiziGBEp1HsRVk8SGAcUvH
         0FMd2+pUugmoIiebriwIWe0FIU7qY1ZZIpqb/YVVvJi8iC/5w+MkQ90iv1zfg9QK2pgs
         nRpGe5aQv2Tn6wLPRLFwkM1vT3br1Hc030mVDhqGo5FuvcZZKyMe1HyK43fug4jA37B1
         ZPRZN58ALvD33RGOqA35OnK4eLNStFeim82Wl25VWh4x8hkYz7oNVe4XMcQTjBj2vZvU
         cOE4RctW5jD6CKHrSwLOlTQiusofSt2u/qEi7E2mujyhw9icNS1enBhU3teqPl8LMC8W
         KdSA==
X-Forwarded-Encrypted: i=1; AJvYcCWn73E7PL/q6A5WflqNAl05bcNRXCBdmq2sgvWTT2/tMYxNL1p2k3Mg0rhDrZlkCPd5IKLOYUbnjAE/sKCc@vger.kernel.org
X-Gm-Message-State: AOJu0YyfcVty406mi3ORUSx6DWkw27xXLsCktZvcyLacylSdDjTZemX/
	TiwPZoY93VokJXkweeNGdMtc5CTDrDlMha/AGl5aHY1lw/StWEfjvEBgMmNFLmjB7AaeSbJVzIg
	qr7iBnBdIXUCCmotzLzPpBx0LCbaNYHkZA2bxRHA6RtYaphM0UOI+yi4Zx9++AU33A+t+
X-Gm-Gg: AeBDiethIPUrOQcmOgKVnStI+4AhGfK1XyYzGZuM8vnAqqW6k+N4CC6VOi565acji65
	V6QrT5ryxTSA0LAFthxo7A4Dc2xiqV1ZqFkY6ZjaX924KMYpyYm8XeWG1jmLgk0YvW2p4QqBR2P
	YRjw5CyRAAljLMBQvYPOfv1X4D6L6BBZGB3206879tTGJv1wndI6696UNqYzGup6EqY3aIbnJ+a
	aXkbaTmdfDpHCdwnsw1eeB9OV/5itmnWXcTpuI+//ijJjOxOpisoRjBQD3ZaKFeh8awg5sxTu2C
	Ca/p2p854G25eHrABMk5GN9A8CqCf+ekqPR63Bvz+aAOT+lz+pHMXFNMETViOGJ3J9AogKtrS1T
	Hv1wQgp6o4eEhv/6otOhotIdTBOZUEF3ZkDowEQcH6/nDmqByQue0qcWY+ad/4YD0eZABZKIf+G
	yHCmIgQ6VkSA==
X-Received: by 2002:a17:90b:2d07:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-35e4274e1damr5727825a91.6.1775887463299;
        Fri, 10 Apr 2026 23:04:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2d07:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-35e4274e1damr5727781a91.6.1775887462566;
        Fri, 10 Apr 2026 23:04:22 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e42e143d8sm2058886a91.4.2026.04.10.23.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 23:04:22 -0700 (PDT)
Message-ID: <ca268d5a-f55b-4f6f-ad35-1f856446c261@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 14:04:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com>
 <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260409-knp-soccp-v5-4-805a492124da@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69d9e468 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1_lOvLO235_I7qwuQ8cA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA0MSBTYWx0ZWRfX/pZZifuFvYAQ
 nmdwI+kJQE1nBPQiR/+DjHUSe4B+5DFPP5MglgSZo/6oqzi/4gtjkZsGYzUxCUPBaMl5XsnehVD
 WSzTWVqqBuqye+fjkJyYrA6rXhTyHWH/ofMnnvn3QPqzjRFSSq7Yquxw75qm1R2IKau9pdtHOx7
 ouZod5Qnv9KogsuwVB/d76OPQRmNPBamx8w59m/f7UPRAIUhasLkaDtNym+b7Lo8zd09LAF/NNP
 nAlQ7QFtrUzznIyiRr/xeqNOXyFtvHUILcZ9tCPcNuUoUZ4WMUQ2NrLoLgKBhiatacZ5Iep+2LJ
 m4cC/kW93nbZE3/pXvkPp/B6e8v0boUmb5KJVzSpgj4IcSOYP+dJT+DhBeyL7G41piIGIUg3nmu
 KjxDBVOYiHtKCRcPwqrYcODyjKAjAvxyN1eOjC2iB/tEwhz0yyIoi+KS+iG6J1Jex2e/laUnOLp
 5ScBAxcIFqbPsFkoBrQ==
X-Proofpoint-ORIG-GUID: yUUa68MqCNJKCtQzCzYM_DmqqWNt9gug
X-Proofpoint-GUID: yUUa68MqCNJKCtQzCzYM_DmqqWNt9gug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110041
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102761-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2AF13DE814
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/9/2026 4:52 PM, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits and performing ping
> test.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the
> subsystem is ready and the ping is successful, it will be marked as
> "attached". If ready irq is not received, it could be the early boot
> feature is not supported by other entities. In this case, the state will
> be marked as RPROC_OFFLINE so that the PAS driver can load the firmware
> and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   drivers/remoteproc/qcom_q6v5.c     | 69 ++++++++++++++++++++++++++++++++
>   drivers/remoteproc/qcom_q6v5.h     |  6 +++
>   drivers/remoteproc/qcom_q6v5_pas.c | 80 ++++++++++++++++++++++++++++++++++++--
>   3 files changed, 152 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 58d5b85e58cd..52247c17c38a 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -20,6 +20,7 @@
>   
>   #define Q6V5_LOAD_STATE_MSG_LEN	64
>   #define Q6V5_PANIC_DELAY_MS	200
> +#define Q6V5_PING_TIMEOUT_MS	500
>   
>   static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
>   {
> @@ -234,6 +235,74 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
>   }
>   EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>   
> +static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
> +{
> +	struct qcom_q6v5 *q6v5 = data;
> +
> +	complete(&q6v5->ping_done);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
> +{
> +	int ret;
> +	int ping_failed = 0;
> +
> +	reinit_completion(&q6v5->ping_done);
> +
> +	/* Set master kernel Ping bit */
> +	ret = qcom_smem_state_update_bits(q6v5->ping_state,
> +					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
> +	if (ret) {
> +		dev_err(q6v5->dev, "Failed to update ping bits\n");
> +		return ret;
> +	}
> +
> +	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(Q6V5_PING_TIMEOUT_MS));
> +	if (!ret) {
> +		ping_failed = -ETIMEDOUT;
> +		dev_err(q6v5->dev, "Failed to get back pong\n");
> +	}
> +
> +	/* Clear ping bit master kernel */
> +	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
> +	if (ret) {
> +		dev_err(q6v5->dev, "Failed to clear master kernel bits\n");
> +		return ret;
> +	}
> +
> +	return ping_failed;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
> +
> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
> +{
> +	int ret = -ENODEV;
> +
> +	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
> +	if (IS_ERR(q6v5->ping_state)) {
> +		dev_err(&pdev->dev, "Failed to acquire smem state %ld\n",
> +			PTR_ERR(q6v5->ping_state));
> +		return PTR_ERR(q6v5->ping_state);
> +	}
> +
> +	init_completion(&q6v5->ping_done);
> +
> +	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
> +	if (q6v5->pong_irq < 0)
> +		return q6v5->pong_irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
> +					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"q6v5 pong", q6v5);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to acquire pong IRQ\n");
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
> +
>   /**
>    * qcom_q6v5_init() - initializer of the q6v5 common struct
>    * @q6v5:	handle to be initialized
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 5a859c41896e..5025ffc4dbe8 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -17,22 +17,26 @@ struct qcom_q6v5 {
>   	struct rproc *rproc;
>   
>   	struct qcom_smem_state *state;
> +	struct qcom_smem_state *ping_state;
>   	struct qmp *qmp;
>   
>   	struct icc_path *path;
>   
>   	unsigned stop_bit;
> +	unsigned int ping_bit;
>   
>   	int wdog_irq;
>   	int fatal_irq;
>   	int ready_irq;
>   	int handover_irq;
>   	int stop_irq;
> +	int pong_irq;
>   
>   	bool handover_issued;
>   
>   	struct completion start_done;
>   	struct completion stop_done;
> +	struct completion ping_done;
>   
>   	int crash_reason;
>   
> @@ -52,5 +56,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>   int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>   int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>   unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
>   
>   #endif
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..34b54cf832d0 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>   	int region_assign_count;
>   	bool region_assign_shared;
>   	int region_assign_vmid;
> +	bool early_boot;
>   };
>   
>   struct qcom_pas {
> @@ -423,9 +424,15 @@ static int qcom_pas_stop(struct rproc *rproc)
>   
>   	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>   
> -	handover = qcom_q6v5_unprepare(&pas->q6v5);
> -	if (handover)
> -		qcom_pas_handover(&pas->q6v5);
> +	/*
> +	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
> +	 * avoid mismatch.
> +	 */
> +	if (pas->rproc->state != RPROC_ATTACHED) {
> +		handover = qcom_q6v5_unprepare(&pas->q6v5);
> +		if (handover)
> +			qcom_pas_handover(&pas->q6v5);
> +	}
>   
>   	if (pas->smem_host_id)
>   		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
> @@ -510,6 +517,63 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>   	return qcom_q6v5_panic(&pas->q6v5);
>   }
>   
> +static int qcom_pas_attach(struct rproc *rproc)
> +{
> +	int ret;
> +	struct qcom_pas *pas = rproc->priv;
> +	bool ready_state;
> +	bool crash_state;
> +
> +	pas->q6v5.running = true;
> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> +
> +	if (ret)
> +		goto disable_running;
> +
> +	if (crash_state) {
> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +
> +	if (ret)
> +		goto disable_running;
> +
> +	if (unlikely(!ready_state)) {
> +		/*
> +		 * The bootloader may not support early boot, mark the state as
> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> +		 * start the remoteproc.
> +		 */
> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> +		pas->rproc->state = RPROC_OFFLINE;
> +		ret = -EINVAL;
> +		goto disable_running;
> +	}
> +
> +	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
> +
> +	if (ret) {
> +		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> +		goto disable_running;
> +	}
> +
> +	pas->q6v5.handover_issued = true;
> +
> +	return 0;
> +
> +disable_running:
> +	pas->q6v5.running = false;
> +
> +	return ret;
> +}
> +
>   static const struct rproc_ops qcom_pas_ops = {
>   	.unprepare = qcom_pas_unprepare,
>   	.start = qcom_pas_start,
> @@ -518,6 +582,7 @@ static const struct rproc_ops qcom_pas_ops = {
>   	.parse_fw = qcom_pas_parse_firmware,
>   	.load = qcom_pas_load,
>   	.panic = qcom_pas_panic,
> +	.attach = qcom_pas_attach,

Possible issue in the future here. The kaanapali_soccp_resource does not 
set minidump_id, so this is not triggered today, but it is a latent bug 
for any future device that sets both early_boot and minidump_id.

qcom_pas_attach is added to qcom_pas_ops but not to 
qcom_pas_minidump_ops. When a device with minidump_id set uses the 
minidump ops table, the .attach pointer is NULL. rproc_attach_device() 
checks if (rproc->ops->attach) before calling it, so the attach callback 
is silently skipped. For a device with early_boot = true and minidump_id 
!= 0, the state is set to RPROC_DETACHED in probe, but the attach logic 
(crash check, ready check, ping) is never executed, leaving the 
subsystem in an inconsistent state.

Thanks,
Jie

>   };
>   
>   static const struct rproc_ops qcom_pas_minidump_ops = {
> @@ -855,6 +920,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
>   
>   	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>   	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
> +	if (desc->early_boot) {
> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
> +		if (ret)
> +			dev_warn(&pdev->dev, "Falling back to firmware load\n");
> +		else
> +			pas->rproc->state = RPROC_DETACHED;
> +	}
> +
>   	ret = rproc_add(rproc);
>   	if (ret)
>   		goto remove_ssr_sysmon;
> 


