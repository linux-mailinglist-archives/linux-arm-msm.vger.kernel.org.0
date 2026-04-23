Return-Path: <linux-arm-msm+bounces-104202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COXkCoiu6WlyhQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:30:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D944D477
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 062BC300DA6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 05:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A8237C923;
	Thu, 23 Apr 2026 05:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EvXS2y1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqGscQjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DCA359A74
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776922244; cv=none; b=rVZnQr3KeCwfHqFBSG9Va+bcFVP6zSu1x45uySBXf2wwYcPDDSyc6SrYgu/vo44nfNH5ydZ3uBCFTKHscH27pcA6XS6qwcg5yitXnh6OIIgDOKvY2o2y5L//XbQw9k7o15o8kaH+iAVApyaLD7+OC3hFRCBEZyHTm6D0UwVHkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776922244; c=relaxed/simple;
	bh=I4l6lrJuTWGwYQ2DlWkBIgtDbAdtX0mad5D97+OmYL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsTgZg0Y70XeICrP4/MofwsjVj5SqpRUw4b8Qvp7xKYLga7UQjyuFpdV7R3tZGtjL/KwcQzDYvB3QUhYevFQKr3Cxq7yYBqQm/kU0H0cg0W5e+tpO3LrQSOrfUx4V6Cx3a9aiP2m1WKrpLKeLjSF5v7bkbOI+7hCgTj2azPebbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EvXS2y1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqGscQjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N2ZOOr122634
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ZD+sN3/yewzLhFBfVPxHnkHX+734akBFjIOW5kZJLE=; b=EvXS2y1zryBn9Lyt
	OlTb+dAcdW/sq+D2+QTKxrHpTVftDPXlpVSv2/A7qUh3eNHbxnou50wCmOeto/Rj
	ilDQ6AEtKhQg2mUvBfAXiChBRlgomh6PyadvlJQafmuSnSPvD7XN/hNqpa7hlsLk
	NbgpddBywkBp1tNJFap+V83AZggphemulC3ZXYr+zk8hqXOwofd5LU2cf8yavplh
	NlGV31qqMxW64y71gjVb1w0KXIVz+gBbaExhD8X7Q1sazyr5R0krwh1TCufMsNGV
	JjD/t07EThO0zodWm/eqPevNcTrpUuauxOL6CjVo9kXpUIawdr3GqsQ2Lyk4nwg0
	kfOwwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h82adg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:30:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242062308so114279095ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 22:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776922242; x=1777527042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ZD+sN3/yewzLhFBfVPxHnkHX+734akBFjIOW5kZJLE=;
        b=bqGscQjWOpBpCp4HCFYQ3yCCPt9l+l5faE/LRwMVRm72k+J4/onnWMD0jf9lz9v9WZ
         9BGxGRlyorv0zKe9YJuYBJRvxQgzLvqTG384Iq+pBw9QtkGfC2P6HVEamMaHXn36lEU8
         Ey4lsnKqVetgrqhzj+5JU0Ck/KYO3dDmz4LRovbgTU0fA+m/tsUzoX79Ba8/mnAuQroQ
         SbTPOnjEaJ1tqUYuz/pJJ0PV4yJZhY46n8NHyluoMLPyVZAgbJ83c1njwHhd6yhdakrm
         QVGhBMKnM5s41upSLSXM3LvdvNueZaBb3GCXRg3rDOAAA/+7rIFCNYXHTmol97l3ojUG
         aCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776922242; x=1777527042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZD+sN3/yewzLhFBfVPxHnkHX+734akBFjIOW5kZJLE=;
        b=Kjg3EzzSUTXGhu4ufLYhfg2QxwVWn+sjJDeaqJDAT9gGk6nprgSMuS2XIWTJoyIMlE
         53g12k2CtXmM6g3zi+tTpAxggwK+RxCgX2CkW83zz6VyW+MR9oO7adcUtcHlftxCjkYc
         OjFhpRXCAYObjap++krNRzpfff1c3eiMSnQSFI598gPlvdSZ7ouzFNSCtqGD2H/yutpr
         eOs6/oVnQWM/515lcwMoyHWubv/DkiLOVatx1ijbdYgPf432dRWXy6nlgDQHxWxhefi4
         diAUzz38e8vVBMZTBabyOkeutrN4Rgv51oxK689fDOUfrl27shTeOQDqeVubok/9x+XL
         Scsw==
X-Forwarded-Encrypted: i=1; AFNElJ+eA8ONRu4iXlPv9sDqAqszh/EQ+30FN1hh4R9971Bqk3AJ/YlRVwBvp/kh56aN5XoRwrAMugUXf+rsGeTd@vger.kernel.org
X-Gm-Message-State: AOJu0YyH39tsR58Bepx7VMby96Wy+6+imI8esxDJeV8a8n+khOWuUzEo
	zGreDowTMGwv9sUtt55NuX7vNIkz9ckJbP54UNhN7uDc98eDstkWEzMazbGL+vVq2fV3Twc2wFi
	GANyBEdxmXfEa8IGuzsOmnjeIA9ZbKqoIfHSj/Pp4DpxkJVh68mMyo9ePUsmekD2RVKMG
X-Gm-Gg: AeBDieujAG/Js0SSmIU6wWGYfjjCCs2z2WB5ZkkXfks9HxgkqbeOVuGgra+1HeguegA
	AJmy+b9TrVuwUkOdAtlYoCa7pCWSZpR8u9BVSnhgQQ1Jn7zwFPyq1Fvd2o9in0BJC2ulvYO1sZN
	hi8gwmT5OWEd3Gckw0Kr1ajHFssOtluH6Ck5g52g6mxL0+pIKLaFhs6ApP9UA5OHK1gs8Xffe5B
	t5RRHQdaa0PkNveveyFCyrfOH+Gl/3ZxKdeDZmDE4JD1hDPeKQdRyWwwfXY45sbHDlZvoJwD1Xi
	QcAFoWuPD3yFnDmDm9p9ebeefgNR0U2tdrgVU+Vsf4m4TS6nqQpQRAJ/z9mFA7vyYlPzrJyl7Ny
	ffuJ2U7qERKdy4uKC5FRf/M+gZuyaEbqtyNZa+DyjHHn+r7qLc3aRrmzKu4VpeN8=
X-Received: by 2002:a17:903:17cb:b0:2b2:67cd:9963 with SMTP id d9443c01a7336-2b5f9fd5c04mr258808625ad.38.1776922241628;
        Wed, 22 Apr 2026 22:30:41 -0700 (PDT)
X-Received: by 2002:a17:903:17cb:b0:2b2:67cd:9963 with SMTP id d9443c01a7336-2b5f9fd5c04mr258808345ad.38.1776922241035;
        Wed, 22 Apr 2026 22:30:41 -0700 (PDT)
Received: from [10.92.175.180] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3ad18sm190222575ad.71.2026.04.22.22.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 22:30:40 -0700 (PDT)
Message-ID: <e772c05b-7813-4fdf-a0f1-9ddc4502580a@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:00:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 0/2] Add post change sequence for link start notify
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com,
        bvanassche@acm.org, nitin.rawat@oss.qualcomm.com
References: <20260422114939.2901925-1-palash.kambar@oss.qualcomm.com>
 <anieqjzuel6lnrjfkckalb5p7u43d73tttapif5nwkjor57bnt@k7wzwkln4bmt>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <anieqjzuel6lnrjfkckalb5p7u43d73tttapif5nwkjor57bnt@k7wzwkln4bmt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0OSBTYWx0ZWRfX4i7wgta3Q1uk
 X0eG7BAsT77vR4dLOdrShB9rZGKMdwb9EHX3Er/ioAMlci7efqqkSMcrgF9QfZTa7/qiELiJSR/
 KO8wvYGFLIjvqxDZmJftQRrPMqkb6ZjB7nmMxuztJ2nsJD/KLVoEOkyVK47uh+sLJi54MneSGA9
 2HVZfc4a8M4/3pGBL6MSOdu2uBvUS7oEDIjNE4ifHvznUPkpi75c/TTGExQ+HmYI+Pc0EsmXokL
 VB0F/D1pS880Kb4W0aIGTvnaOsTessGCJajCYHOhJ+IQQgpEzZT/hz9I2JfG4mSIsckfsPf5Wl+
 x6YBsNpQBvd6QXnCy1oVpzlFQ6Mx1kCnqqsBSjlCtCGDgEH0ERZX5Yp0aCaLPUOiVQcL/wL82Mf
 etW6bZ3QNOKCcbYoy4QC54ha+2MAqlOpxE9u8YAc3vpdEi0GzscuKbM3KEw4QyCfzcBTgab+W7O
 7cNxzo6Ryhw7216jpOg==
X-Proofpoint-GUID: mpzZiC-BgIrunNdTYKsKCRXCdt7PGsnE
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e9ae82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_eKqZ6KB7bK8Kc-SDgkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: mpzZiC-BgIrunNdTYKsKCRXCdt7PGsnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104202-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 800D944D477
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/2026 9:42 PM, Manivannan Sadhasivam wrote:
> On Wed, Apr 22, 2026 at 05:19:37PM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> This patch series introduces two updates to the UFS subsystem aimed at
>> improving link stability and power efficiency on platforms using the
>> Qualcomm UFS host controller.
>>
>> During link startup, the number of connected TX/RX lanes discovered may be
>> fewer than the lanes specified in the device tree. The current UFS core
>> driver configures all DT-defined lanes unconditionally, which can lead to
>> mismatches during power mode changes. Patch 1/2 ensures to fail on this.
>>
>> Additionally, certain Qualcomm platforms support Auto Hibern8 (AH8), where
>> the UFS controller autonomously de-asserts clk_req signals to the GCC
>> during Hibern8 state. Enabling this mechanism allows the clock controller
>> to gate unused clocks, providing meaningful power savings. Patch 2/2 adds
>> support for enabling this feature as recommended by the Hardware
>> Programming Guidelines.
>>
>> ---
>> changes from V1
>> 1) Addressed Shawn Lin's comments to fix comment to connected lanes.
>> 2) Addressed Bart's comments to remove warning and trigger failure
>>    incase of lane mismatch.
>>
>> changes from V2:
>> 1) Addressed Shawn's comments to fix commit text.
>> 2) Addressed Bart's comments to remove variable initializations and
>>    indentation fix.
>>
>> changes from V3:
>> 1) Addressed Manivannan's comments to remove extra comment and return
>>    logic.
>>
>> changes from V4:
>> 1) Addressed Manivannan's comments to fix indentation and return
>>    handling.
> 
> And you dropped all tags given in v3 :(
> 

Sorry, missed the tags, will add and reshare.

> 
>>
>> Palash Kambar (2):
>>   ufs: core: Configure only active lanes during link
>>   ufs: ufs-qcom: Enable Auto Hibern8 clock request support
>>
>>  drivers/ufs/core/ufshcd.c   | 35 +++++++++++++++++++++++++++++++++++
>>  drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
>>  drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
>>  3 files changed, 56 insertions(+)
>>
>> -- 
>> 2.34.1
>>
> 


