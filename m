Return-Path: <linux-arm-msm+bounces-108925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC5iDMmmDmr6AwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:31:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4959F6B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D274305DEF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 06:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC59E39526F;
	Thu, 21 May 2026 06:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7k0N3xx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxeVeAXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3498E296BD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779345029; cv=none; b=T/RZG3gXJNNi9WHzp0ET59MdSszaMajZMIQWEJUDkXTpDCN3Pe/7TvyKtE4jUVZysOYoHYR/XGYG6DGY+u8sT+kImpFFqLHsLmi/1u2snXppGOK6zvFRV0Zm3+QU6RV8YQSsImOBRr7qihlIrk8mA71z9yA8iMIId7lvNUFa0Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779345029; c=relaxed/simple;
	bh=fq3D+X3q7ZbEaR+KGlXHcg5ZzcIxpXF+jpXKklId51Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUzXFf0LLc4g6RU8YRMJuhWsUvlFBTPTlBsxZjlYznfTjI5OBnUyQ27jk0AB1OzZSyG/t9ZBl6cfw3h/KqMsWxEROajBl+M1rT4I1pbPLP6svig7akxcRXKnac24vIf1D2JYgXawqJKO4c6xeay68cgHlsEeLF1NmAwUTkY2Bd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7k0N3xx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxeVeAXq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2T2lW3816658
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcFnBmlGXUBnGQMannLvnZzhlvDc+81ZD8yCnd/foBU=; b=g7k0N3xxmtSzuTP5
	5D5t/X8ZeozBD6m1DF16BcKLvbd8VFULNoVRu3uRU43O+y7D1vZNfucCYlLcKJFc
	vl8fgFjDHUizBRQxRNmKP9rssOaKgSyHgpZh8HHzK+rTyzCjDzMwwK1kWDdqnGGr
	RZI7xXViQQI/bw1w8wH+Pm3wj8bhhdrR9zkLFFEE0g1Y3FXaID+SiKVJeDeihTsU
	n7YL2XKftFfGTCJSwgkijIzC05xOMpqTZr0mTHTaXR6UpEGEdecBbazHnwENBMoP
	qEe+rHKVfhZhbu85Ju9OiX5jOjVCKaDdoTrdDSJIggA/Mmr5UBtvw5l/STBp1VWl
	QsWIYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa0rn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:30:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4530a90fdso101845425ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 23:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779345025; x=1779949825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcFnBmlGXUBnGQMannLvnZzhlvDc+81ZD8yCnd/foBU=;
        b=gxeVeAXq8tbSz5thLusW1uxGuEMqbcGoYFMfUK+NG93+28SoMXMqpKPQctBZt+Xg3d
         cD/mfrW0TcwMZV8jCIPnTk0/mVs1k/zlfTDBvE0XY6Gmn+96Y6GSLEFRLA+ytGP6LsNx
         dLHKEsdgPYnlf6o4LgUhfmBZJJ21BlAUihJ3L6s8/xKvwCtsh0YX/qLW8fKSUYsnBUtt
         /exZU42/GnWhnpfEG1G9zF0FBKOWqHpyXnnOFIt81mhlyAIMopZcu1Hw2edz4IIwzw5t
         COHe6ES+uOURtlb0eTHupGUaeekoSOo261AETvYB0L7P5x0rCVBXkkXArLDZ4f6E9Y7A
         XIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345025; x=1779949825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcFnBmlGXUBnGQMannLvnZzhlvDc+81ZD8yCnd/foBU=;
        b=glr+FcVRaSKmPZrvz+jrPIweraiL0EOYrR/BNptNdXqjf9jdk/pg1QyhEl4GdVfu4P
         AgGXPEVFxxorubo05CLkR1ESMot1lHz2ddg/NCaoGTHsyiGyWSz8Zaralga9yDgG/srk
         MMWyBQ6M72OwDpgMTS6iHAhGQ2tOcfBug0o00TyouybyTW3+Sn7CYtQtV0CLIZtBezt/
         sznMQFSXtOrvdSciYRp8yE2hhsJOllVH2gkDEVbd9XNe2eRbqw+ygJ4RqQlsh2VF+GHn
         sSqctHJe2q4l3XIaTRl/7WqdCLeHQ6hrR9dm+j/7krAko09hOsP9ocFJVc7kTNp7u1ks
         QvKw==
X-Gm-Message-State: AOJu0Yyvu5BzPfnte5HGRxeV67wgT4uWetrKlXBYvFgneky/5r9eTW3O
	kbrCD1tTcCIOqSgDLdNWqycL7ewDw0TgmAE72fQHdFFL0iAw/65cZZJO9NACqCrcPgjWf5Zkx9H
	K6Eh3SsNAI9h5TCI8iFbxQOpvxw43DNcRy8nyrBsQmnqVBPDBSGSckSGj+mZ4MRPLRJaP
X-Gm-Gg: Acq92OFM00ILwXN8t+kl5ZQfWjJCr7Nx5hawMxHiCs2R4mcTccGWtg+7rl6gcPcqEfx
	PEk7LNI4fUrMKv4BmVMoAFVuLPn0n7aGQHSMQb/ndNqEczvyI/rZUui7b0Op0Yhfk6B5uKn0S9G
	8+UOXTyVMP8pfHhRXbCEEYoEy2gga8XqAhmFUUm3Qit5ur/Tnh6cSfzAYQEz6ZF1acmZZ9KF3po
	/ddnC1+AvmkySxwMU3U1f3fXdlBsDOGAwjeoms7MKnzmNwQW+Wqp2W3dYUSauj6AJn9zQdEjiW/
	ym+TQ2R/Gdxo/EZx1qvqNXgs7QQb/dh6T7INYAWsRzhrVZDWKTpgQXWJEBqIG67U8QK4C6zJPpe
	CS3iwAMI8/RoU/l22DqZ6OK4NmVn5UtLbFgBsv5RdQWWHisG+PdOp9Iqs
X-Received: by 2002:a17:903:1a27:b0:2bd:ef12:14d6 with SMTP id d9443c01a7336-2bea33e5a0cmr16911425ad.34.1779345025358;
        Wed, 20 May 2026 23:30:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a27:b0:2bd:ef12:14d6 with SMTP id d9443c01a7336-2bea33e5a0cmr16910625ad.34.1779345024887;
        Wed, 20 May 2026 23:30:24 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c263a0fsm241748305ad.37.2026.05.20.23.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 23:30:24 -0700 (PDT)
Message-ID: <b62c2a16-9e73-47a5-8bf7-3878e21c3da7@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:00:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] media: qcom: Pass proper PAS ID to
 set_remote_state API
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260518072856.22790-1-sumit.garg@kernel.org>
 <20260518072856.22790-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260518072856.22790-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2MCBTYWx0ZWRfXwURdJkNClxd0
 MMPROjUKV6pecRFdN8CBE58bHwa5uWaZwPJJEb/Q7IvZ6Jq07TFzWTTk0HnX1a6CkqKsTkWsjPK
 5ixt3f5mjXlNE9L1EPT+lHbO63zWfBBpNATS6RLBhzwrcw7xc0NgmfXOjjdffWWCO428Up2wlW6
 rY1bL/z6KfWfW+EmvwRPoMZGn0R3y2TtGM05lvUYrUf+/VsrwCsuQM/CS6zxj18VlIpXsn9dWIu
 bavzKKOFoUuPws78o0nSOUXXogDA36WsOkeTZ9oYCKRE7PGGwDNLR2bt4427VpTvCx+obsz+4Gy
 WSPTHJWlTLULXr3EZ0LLI38cjRsZufeXk+Ch9zmQ16TjB6XUKllSKUDE/UN1vBBU/ZBy9JODG0f
 HG/uEURFhGME9qpJq65Z6t8hch/uOAPDe8XK/Z3EroK5+RHXSvh4hHfoo4Kvt4VQ9XgJjma2KTR
 7qty63uGFweQLpD7VEA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ea682 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=X+kW/DRse7pI7A4riirJBw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Reuo-bjlSNWgIop-ackA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: A8GrdQ9YzuMCkUNfRETT31ZiYKh1TUi5
X-Proofpoint-GUID: A8GrdQ9YzuMCkUNfRETT31ZiYKh1TUi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210060
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-108925-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88B4959F6B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/18/2026 12:58 PM, Sumit Garg wrote:
> From: Sumit Garg<sumit.garg@oss.qualcomm.com>
> 
> As per testing the SCM backend just ignores it while OP-TEE makes
> use of it to for proper book keeping purpose.
> 
> Reviewed-by: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg<sumit.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>   drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

