Return-Path: <linux-arm-msm+bounces-117169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hshiNHmyTGpHoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:02:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1EC718D12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:02:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c3XMNBfE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PXXT1skA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117169-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117169-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6740930382A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8139204F8B;
	Tue,  7 Jul 2026 07:39:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F41DDC33
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:39:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409997; cv=none; b=rBH8zDVN/9dFeYiIRul5P7yUWr84B3qHja0j4l5qrN1kkcYS3mRfrzDlUg5p4lHCA45+uC/ANT2DO7+YeNRjxQXA+v7ba84TWkWSHrtWFHIsrCX2+TGOhSJT6hoLxrMeuwaUl5e3RGUcsa6W7Ng27Uku+RVy7c72tZjlKHjEGUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409997; c=relaxed/simple;
	bh=VaS6I7tK58WCIBIX5HImSn1Eh6NnEc4K4Tny1f1ok8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaHQX2t1QlnIOyfZ/T9kulzUb2Ejo70zZPXa8r8GxygUjeXDSlSH5n+2nffJLstHhzX2Tt+Sk+JUcIXJi0ynC7jxIHOYKEF1zihlXWPLcvPvoaCF1x3rJ1FQ2KVWf/6N4DpLYa4H49RLALm7EAeGv4WgqO7gugJutTFsF/8pjF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c3XMNBfE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXXT1skA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748r1H2669721
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5VwMHfBch81Arpnf3XxcrLytGeCBsLmqMYTF8TAhRc=; b=c3XMNBfEXPwObhEC
	sYYcdbxg9RsVGOFU5/laQ5mqY43/UvSv01StTZ75ysqdcu/PYj+NwbWIc7uZg7aJ
	jeiaE0su2gJtHNsYMs8LxYPCDxSOR6HRxi4AzGrsHr1DZHcPfFHwSjRfULBwuXrF
	Wmc8TSuuN90b0ovWr5hbTbkxVc6Scc/8GgGUE+urVZan9NiiFEGV0Z2utzP9Wz1B
	LelIiDjV7d2L9gHSRr271AKVU2JVSJhQp8ayCktJ7QthLF5G4OOy5ZkNcoGofShw
	pnMMKnIAP2lQ6iyjlslCRWeqQrI/+U+bh8sr4baYZp56AvZ2G22H3wp4WkSmzoS1
	+SJsEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgvv8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:39:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c069f73e4so12680991cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783409995; x=1784014795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5VwMHfBch81Arpnf3XxcrLytGeCBsLmqMYTF8TAhRc=;
        b=PXXT1skA1ht4iaAJesuJufej6JAavBXOArr5MzV8eBPNY6JXR5WRtVXS7mOZEwzNgm
         IZ/0eaJQ7V2oqv+tybbCcFnZvMKvdKDfJ+X+nZb+pic1HQekFUGrfqe20SkjCRHG3bDN
         cd8+tbUrii2qal8KBU1ViRk2JYGYJ0cD8U66JuFUNRBLdUA2Uvgf4cQfXRQlKEs1/WKZ
         e3TxzztYg4VywK4vCqwt3RhhwD9UBu/Di+8wWSSZVJ/TjX82jGPmXEAgtj3LtkgaEryC
         Eo9fx31fGt2WaozD/QC/SwrnYS024u4Ql0jxgOd7A8b0ltx7erjLQIjj8SKs48z6ibcc
         IcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409995; x=1784014795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5VwMHfBch81Arpnf3XxcrLytGeCBsLmqMYTF8TAhRc=;
        b=PnNrxrIPS92N1cBTQ3MJwdKfw3w3O2+PdVAgkzraQIsdYVn/Ck6XiQlHT4NaxlHM7n
         bictwyu4pjQ0R7Rn9pXiNdJJFlIn3Ar92/0u1TkPCoBxh9k8y+7biXmlOtzqFQj7HF95
         EQhZwY7bc8T4Gy1mySQV2OFmLPmmtNLAUUiRABEDZx7FVYmKsfQAT9/IQ+JyFy7qxM7G
         ueJsGS7Yx3NSjtMDM6VvhMtMPZ9rU9YymEjjas987gP2DPFPphhSSs1oKkYuVbPWHrfN
         pVSXpU7mhffx1WpFMBKWWwh90r7ywmu80pozb9orfK/v3q2ADsdqlMjBvE86+4KQwBbf
         e3uQ==
X-Gm-Message-State: AOJu0YyVesxvgCNPk1g+szors8IBs9sqZnMrKAp3Hw6EsL/R6wq5/kkM
	l93Y/X3rb/5HcEzXmU45pCgOI5UBorw7ALLR7VUGbPcGqQdsPM67kgUafTgqHw2cb3mgloEh45o
	Hl1oI5JJvjoBZIStemzZ6BE7V8yRmDFxYWSBSJl7Sge0AGKwBgYOT3cuGr8HSyi/oQ3lP7m1JRz
	eB
X-Gm-Gg: AfdE7ckzybm9An56qe/geN/5KqX/g48C0kA/Sh3xhW7Ash8sm6w/Xd0zYsY3dLuhl5e
	OvLgqD6Kzi9ZUboGkQdWOulwdHBf6THDlpnWYJSRZ+EVcfb4GJFWz9TRJwwjMmumHqtTSLUy8Ef
	U6g0nxkMJmM4qyrlF3/m7u1oOcz74bbAbF9onEeNiILKV4R+fi/yqUN+3zk/v3AS7JCi3so+rPn
	FzcNruGTAHwfRIMyedpTVWMT+8gSULJ1JximXXmHmYS+2V8R4gpCVz3dMrz7DSNVnApwhJMbFk2
	AbpzEDjn0lUqJCsidJWhBj33GMo/IShWYy03iVdTjcW188GYqP+ACB8D0LSoniLnlvm2svUWNL+
	qDyxBRZjbj/L8X4AD0My6NFfHZ3hAAWSSjTw=
X-Received: by 2002:a05:622a:15c2:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c79e120famr14083971cf.4.1783409994740;
        Tue, 07 Jul 2026 00:39:54 -0700 (PDT)
X-Received: by 2002:a05:622a:15c2:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c79e120famr14083761cf.4.1783409994334;
        Tue, 07 Jul 2026 00:39:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19daafe2sm5002929a12.25.2026.07.07.00.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:39:52 -0700 (PDT)
Message-ID: <58acfac4-3bdb-4ead-88a1-376d88dfcda0@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 09:39:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] phy: qcom-qusb2: correst PHY description for
 IPQ6018
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
 <20260706-fix-qusb2-v2-2-8d9cd73b1db7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-fix-qusb2-v2-2-8d9cd73b1db7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gpyFXQ_myKnjuY7gN7qvan8Vn7-3eo7p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3MiBTYWx0ZWRfX0wBR0EsSn5EJ
 Jx6jFnwnmB7PYzA+YOfoHVfPjAw8L0Ewy+gaVnyxUMguUeNV/kgyN0vR7oHt/17yORgMccUHAyU
 crYy6Bt4ZKMDlUhUGtisNvLQIRhA87vTwyMJXkZqkJgUWt0Mokf3gGFCEhUSqAz1djxGE8/zafZ
 HbpMQSOa75kp8pnFJ4lgE9Cfld1Ij+6fKoyCrzGbqOkGVHSH9F4TvgGRsnckpC2xMXpx0DQqYWA
 VXvkkz2A7V1BevQqtirm8wUDxk761UkDvF0TKaDuSJLLkrmFevNduUt6bhjB/HEnFaCWijxtuiW
 XlZPAbPMQvc0D3nvrIn1g4FMk9UROFqY/pjtSDTTUclZQSr+2297mQTumyalfhL3Zii0jVIfW+j
 9rS6vBqCbVl8OZ9RFNElIt4ZIXxGdHcOWOPn7SfdhcyHNNCJfTAPMpZ2+0NlXAAxKzHJE6GV2Il
 BvfyGdeAQe9VTado1xg==
X-Proofpoint-ORIG-GUID: gpyFXQ_myKnjuY7gN7qvan8Vn7-3eo7p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3MiBTYWx0ZWRfX8VqQoemCCKGE
 wqk6gEx6SL8epPaodx0hM4jZWgLmdjU1LSYMVhKIR2ZOyAVqhWhcU9jODtTJl30OQGVwIioVeG/
 nhPHQM9xImQ4OnnPBqt1Hjsl8fBdijQ=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4cad4b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nGQjb-Uw_c1jaiDCqCoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117169-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:mgautam@codeaurora.org,m:kishon@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E1EC718D12

On 7/6/26 3:53 PM, Dmitry Baryshkov wrote:
> Qualcomm IPQ6018 doesn't need to reach power collapse or retention of
> the USB voltage rails, so autoresume is not used on that platform.
> Instead of programming a fake register bit (BIT(0) of TEST1, while the
> QUSB2 platforms on that platform should use BIT(3) of TEST_CTRL),
> explicitly disable autoresume programming on these devices via the flag
> in the platform data.
> 
> Fixes: 2cfbe6765b7a ("phy: qcom-qusb2: add QUSB2 support for IPQ6018")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


