Return-Path: <linux-arm-msm+bounces-90745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEetAB2meGnVrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:48:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5660F93DF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 015CE3048B13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36AA345743;
	Tue, 27 Jan 2026 11:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+v+KWlN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoIBrLSp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BE734AAF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514372; cv=none; b=mCE4ak6RsxIh68hkiCfeTqG0Cqq71x8bFOsDdEYQHLcxdymPMiwcYuq4BEwYrtaG0rBO//3gxmr0LoepgO417sr/i5Mla8xi83AqLGMQIfglOvPH0g6DXxvWBfY7A6meaaAuBlX43K0koYj1RpcG4Bz+35h16JOQn8rDTKPncTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514372; c=relaxed/simple;
	bh=8Y1fnVKjp6IEWN6IZPMX6ZFWAIUDi7MjIKUCO35bMEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQfBVLfKG9lU7PNlfKBb6Ls572nzADTeH8a/bFl2hImCaseXmrQbsDmc80VKf/9wowF4SBZrI1/wtVes1LR4rHbbmmXZtAqQFrRIKMjQv2uL45UehcjvMTi/kWMh8WiczPCRANvV6y0L4xgz2I2LfZiD4tuSfeoJJUGX99wCNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+v+KWlN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoIBrLSp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87PFa2379408
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	camxT/u1sDFfuBtTBfipsSGIU73/JXukIB+LwjhlfJQ=; b=S+v+KWlNoBsmq0h1
	1ygpjflBgFfM84y7N/gN9fxPKfNywRPj+E/ge1sItcHEZliiycD5xqClekCfYeva
	ndpplnAOpnJFvJw/7BcZdSMIwFsEILZILJF7Br20hTyE19UftprZpuGPh0QFNdab
	fFJnt+vbiNAdN/wXU0jy1Jxg1HE0ZEsv3YObNLubTPbJpM7IixvJxqTL0EUKT/c+
	UeLKYzyv8ppImS0GT4nl44bMFd9dtUXjGLL3HzBx3wK/RG8541rt0yOMyH5/SGWS
	0/p5Yfcw45oD/MNFRLzmz9TUwEirYTV40pNBYpq4854KQ2vSQjOf4oRhE12ukgx0
	ZmNbTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr8qap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:46:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a182d4e1so120280385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514370; x=1770119170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=camxT/u1sDFfuBtTBfipsSGIU73/JXukIB+LwjhlfJQ=;
        b=hoIBrLSpaGvz0NqSsMTTcUhlh1nbd53uXJ40+z/jTh4xzt4by8fOxOuqSlNckw2wg5
         TgtSCedO7FPbgEr3EjuK7Gl64bnFgyvq5rNlAq3XG2YpKveXZSqI8wVVGyFfexcnUjF7
         oSEsvodVRH/opc+jGRwiXUTr0QU2STjRxR7A0Z4uqgkP5xpGwWpaGSQxBi0rcBvPBQkk
         rvnKSdXgHGZubaGJ2TfFk/MiAFG9YAAMaoWnZmGJVFeoloV/8rCbxAs2iABkGIFilLml
         Odd+hZHgh+J38biL3otiIKvJqDYAUgAjX5xhs73OyovP7VJ3HgEGXdf2VQqptJDw2gS6
         Xx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514370; x=1770119170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=camxT/u1sDFfuBtTBfipsSGIU73/JXukIB+LwjhlfJQ=;
        b=PYrwZbUfRt25ORDanQUqt48yit7ApBwM7lBx5YNseJz4HHxqe8lQ9oBo/zJhTc/vVy
         tm0bBERMcHB+zB8bhmzYDNYgcXqjsSLhWJsfEqR/xDvuPce/5EFxV+X8m5rpieY/2mWe
         jdBUrefr33N8dBSQWwPbUecepwK6NcoLVQB1hclnS4gB0+g1AK0riZC6tPJVNek1GCGM
         fcMXdKNRnLOgXIQxT9wwxFBuLEu5pVkt65FBu8dh2xmUg9yoI3jqZA3HbgOk3A912PrQ
         7bnoQ7HY++3Pt3WyFh3M2hEx5kuE+8b5AzAfrC3IgemXFAB4WMcnO9qEArO2Nsyz5R7t
         oYcA==
X-Forwarded-Encrypted: i=1; AJvYcCUTDveWYDcBCcQO/RronJpENqW1FTW5nIIv39Vr845dU4MxcmG1Hh9wuSTKzO5IsFJp7GquaHDogGh9Nbfh@vger.kernel.org
X-Gm-Message-State: AOJu0YwyV3swp8F5LwsiPRM4MTE8FTn2X7W0L1NZZRH0D/iLcrvbfFrP
	1Mo0st4QCqvd3RCFTfq9T6hFr+70622mHFBwF+Id0KedMhvC5Ly/Q5JUsKqP0lh01Id0Xf1dwxO
	KJAIUsLy5qwXnG3bhz7B1/GFGpGRNsbHEGzxvui09Y0EJYQlbIojHl+zmkMtvGsO2qcuN
X-Gm-Gg: AZuq6aIdWL6QqNHBsvwUSD6/1PQoMq7mB6GN0X7oWOP/YeyP/zhp3/0jlcyawmsPUa7
	E3zNgfQQwPNhk1BmzPY+ZZnZ2OALTcUXlkS5m1ndDFspYIODn5ELKv9QEUL3iIYyJiYAJRo6vUx
	2B++r92LRXAQL4my8O/NHPJXCUzo7lmtCykn3Uuk325jN9avAnBu4/7oPLwE8Pp+ei2DLPmET16
	vftCr8ncg4aD3Ewi7s7j8IUF7sYgugPhhancMDfmOYQUyZpPzhazb6smnUH0zO2eNLv9mDY13eR
	8+/NI4yI6E73OVTDd4RqznjVnmXsiuJUoifT0qONLKgnwpV23zRZ6wSttbTENawiTi9sun2YLAa
	V0Z2pSOlVL6sOxgYhxF7/zsF59Zyt8z0lxva4JoVQl17xf26xIHCeF7UDbO+UTJWRtdw=
X-Received: by 2002:a05:620a:190a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c70b84a25bmr120911985a.1.1769514369745;
        Tue, 27 Jan 2026 03:46:09 -0800 (PST)
X-Received: by 2002:a05:620a:190a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c70b84a25bmr120909885a.1.1769514369228;
        Tue, 27 Jan 2026 03:46:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b6fe45asm784820066b.35.2026.01.27.03.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:46:08 -0800 (PST)
Message-ID: <4632ad3a-c893-449a-b0d1-48d9c93da7e9@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:46:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
 <6lieos5uudkgynizozrmzrj5ov57frzzl65b2fpanwbhbmehot@z5uhyv4ipyet>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6lieos5uudkgynizozrmzrj5ov57frzzl65b2fpanwbhbmehot@z5uhyv4ipyet>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ouFftXsFR1Yaee5Jj5i0OdYpUBAg9XOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX/5nGE7awFj4P
 AfOu+vLmKtStWoBUJzXQrolJdIB0NP7c4eBGLc1tGAMmTbi22sm0eO+NwX2WbTWSFr+kZlxMcq1
 88aEzwr+fKYcaKZSQ0Ql65VFCHApR1Oww1VeLyC4JaoD9QvLds7xbBUcCOlxfkXes6adnr/oohS
 JTIthCC6zBHd9Dt4AkViPZRFKQJsVS1hd8mnJ+TTFbtWT8JuB8L6hId2OJCKmHugthCmvKXrRTR
 0pInW64oDt8ooBTzDPSn6AfB+4ztxi3uqMkRmkZ6GGBKNMmgoYYgddF0deDhVTxA/0DMVbXoJt2
 qWnwWHk0lu4By2cFB2HWWHrraxBGUPHBTTjOuXBtb02mO10RSuvgrXqIZmLowTWFBDyNZig/Opw
 JLtB5tG8ruTvdO40390R+HBP3YrFCCTSDp7o5OfQOtVZNf30AVQyupqTXhERd/ijjV2VbzMRHqJ
 HR5MK/T5ja+t0TRM4+w==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978a582 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qn_fkN7zqQ4dxzFuYcEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ouFftXsFR1Yaee5Jj5i0OdYpUBAg9XOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90745-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5660F93DF3
X-Rspamd-Action: no action

On 1/27/26 12:41 PM, Abel Vesa wrote:
> On 26-01-13 14:13:32, Konrad Dybcio wrote:
>> On 1/13/26 1:33 PM, Abel Vesa wrote:
>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>
>>> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
>>> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
>>> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
>>> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
>>>
>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +			snps,dis_u2_susphy_quirk;
>>> +			snps,dis_enblslpm_quirk;
>>> +			snps,dis_u3_susphy_quirk;
>>> +			snps,usb2-lpm-disable;
>>
>> Other SoCs have a list that's much longer, please consult Wesley if
>> this list is enough
> 
> Checked with Wesley. He confirmed that this trimmed list is fine.
> He said he dropped the rest since they are related to the power saving
> features like USB2/3 LPM (l1 or u1/u2) and we don't seem need those.

Is that to say that those erratas were fixed in this hardware?

Low-power states of the link are no less than desired is possible..

Konrad

