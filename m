Return-Path: <linux-arm-msm+bounces-107400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOcgFYe4BGplNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:44:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D925383C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 559D2307E660
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFC243C044;
	Wed, 13 May 2026 17:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="geUkzH8u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YS20f0yU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEB13A3E8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692884; cv=none; b=lBsg2aywnd7OfFhMl7E8gwrb6Cas1kEUT16DtTP26NfTkgxCaNgIGV8MhGD8nf/Y4Pf+iTNLq5fyx1oIzDjKjcdQk7ksOVDyzbEvzxGz6nQC+iDJ9NdK+0nY4hyrN+792iswkziQncgrmJr04Nmz+6e/zC0sPjkw3miw0uzLG6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692884; c=relaxed/simple;
	bh=v0IV5J3gGx2xBoYRV1R+Z4M7mKLMB7/0g67CTqMH8I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4+2hQWB4NKDGPxLCssTfhm309mO8kXZejAvMrmlpLYIWkrqQ32NQyMgYceWUH3qYajRG0rtoShvbmsT+bSlGj6q3IV+8zw6SvtYDsaSOH6DWXIuzqBNsiM9h4t2i8IqBEUT+f+vOgtjzazDw7A4yIGDNHTwXQfeLpab2kBHEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geUkzH8u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YS20f0yU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAqrI2524310
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	64CGNQDAMolvqQS+n3X5oH42IZWBrRm8X32aGPTCYYQ=; b=geUkzH8ugbIpy1OO
	62i4XuoCUdGn96ZBmA1yo51A95Momi59EYOGcFV5azv0uDMFXc2rmYbqJYfnnv+J
	M62iehyevwymqhPa7j71hG3u6PZIvcF1FSAqNZ4OQKjaafGN7Qnt3QTbpR5P51XR
	fyAIeaFfZ6Y3r2uUc/dK3GDBPAw/dLJp9MgmNStewb031BeqS+x/yCj0JuetEtix
	GctQFROAkvXEOYTNQxSzTk7Lsiigt+aJtIG+SFE1Ul+1VXuzD31kJX8Jnd5mGYI2
	DOK7nnzuXE5UYm+JgYHJKjHKo0cCIKveS8Zza3DRK8cILZ1iLvh3WfjhxVcHNq5x
	hS+kLw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjg9nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:21:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso62613005ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692880; x=1779297680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64CGNQDAMolvqQS+n3X5oH42IZWBrRm8X32aGPTCYYQ=;
        b=YS20f0yUAx83JXpLoAoc7QCB55czqiyO3ljkSLSOEXsSQpMFOmSRGV9ED0CKM15QgM
         dfTO0N3oFI9+iS/AwHCVjLS8uHPzPJjupMRaF/hihktjiMi6Ds2KoInEf/aivEVd2DSR
         +y1URt8F5g6O+2jCtohyvFTx94IHxwCwmKmYYTz+CQpiLWJ5B5CGLT7MWkM3FMRX+M24
         j/FT+y/hWMMdD8zil+Ce7Oz5Vk3fUBe57ZmD/ZbO9MSpxr7NRmlP4QGMZFjWtQ6TZkUl
         umtVTLAahpXhtkpS3IgW8KyOZgTVWDVDGVABcvck/+gSDSQNCujdgcM52MlkkIAVWqzB
         iJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692880; x=1779297680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64CGNQDAMolvqQS+n3X5oH42IZWBrRm8X32aGPTCYYQ=;
        b=ltwhofZzGQJp4yk4zzmXEhkWyXtXA1AE0+8h0XRH0/pe4NotJdlPyx90zJ5vhPmItN
         0FyBU9bRR4zPWyQmyblv0u+ymTMSj5g04hbT+GlrgsxdofWJoKn59HGfAdTpVyowHU4Z
         kJEbxlnp9IkOvlQmvbQOxzXSQ/COKgUNHw6bsvFo+VgF98cMwnrwzlwlqXGag8eKWuTW
         B4tHkYr3U7d+FlNFEu6FUhR15/I1nblENqkJlDej6rNmBIz2z2AfbmpjEoxpo5GOLOAy
         hoCLREEkjJN3zKRlZX3f7Mw87JJZEPAXrM7Ix9sSrmcEiUkXlv8Ypto3RG61DyD6/Xs3
         HrCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wKRp2CvRMnM5hq8lz8RKDlj5EJenyXr+Rfmjf8ypc4fNm+8k3Fvgl41jJ6pKdDa9roys/DxGf8qO8JNG9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa6kYphf2jjNoIlwPRzj7UYm7+OE55/i324vP1/vBbLbaeDn1b
	3aGnAGxo4CY+8ssn6fn14hYZ2UtCqjOa0utQee+pcVhfeZtJOebTEBFxtPV91y2a6wxbvGJ8DK4
	S5/3aZov/69+3MD3/p4Fki3py8Hkfp8z55+/pDg0ZehOrlVCyQoBK5BoHCqAJByCgvSD4
X-Gm-Gg: Acq92OGs+op8iF9bmH+TmmNoZY0X2+kphiGwhcuBWOo8OdGJIbmRqgf4BDFJdUHx2ur
	VWogjCh3UTmj3qVhEw6jzMRnXgfU7xFST5SgMqikfHo7GS7HAhZqax/n25LHPHNsJVBmBQJ41DZ
	yUqUscsw74tWJUdOVbBl3+BIP6fIeaXPHPxSfAPWZLoIbNA4SmmopPXtmNT8L11fbKER/nhLqNf
	QXHQzvqbGRU1ejFg4Gs9oqH78fSeBG01ZiUveyQHpe46RcCRrwKWX2IMBPqzcQnenP9pgZyITPW
	JhGvl0rPY2glr4cAPO8a5zuUaCtrUjAuBMIke9cqKmPjTDnRr/2S0cxSzvadcPjrx3T0xbK1FhP
	wVwvIn/I/wVHMZszJ7wT8S05VouxNkBoAOSkh/Xch+W4tOXSzBUs=
X-Received: by 2002:a17:903:f8c:b0:2bd:147d:c712 with SMTP id d9443c01a7336-2bd27133c75mr48061005ad.1.1778692880454;
        Wed, 13 May 2026 10:21:20 -0700 (PDT)
X-Received: by 2002:a17:903:f8c:b0:2bd:147d:c712 with SMTP id d9443c01a7336-2bd27133c75mr48060635ad.1.1778692879972;
        Wed, 13 May 2026 10:21:19 -0700 (PDT)
Received: from [192.168.29.116] ([49.37.147.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d271d1sm174203325ad.11.2026.05.13.10.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 10:21:19 -0700 (PDT)
Message-ID: <3ba11863-e7cb-4697-af67-44a26b19ca8e@oss.qualcomm.com>
Date: Wed, 13 May 2026 22:51:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
To: Bjorn Andersson <andersson@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Neeraj Soni
 <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com>
 <afmuncmBrrvddHTU@gondor.apana.org.au>
 <b8805117-d54f-4e42-a7d4-6fa18af63e69@oss.qualcomm.com>
 <CC0E438D-5544-4BB8-8512-7F93A7FA4DC1@oss.qualcomm.com>
 <af6MsD1wDs9EZl5q@gondor.apana.org.au> <agHkmKq-q7_6m4nl@baldur>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <agHkmKq-q7_6m4nl@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L1Ya8chu9zjFC9j206hBReb8aOo2KxWy
X-Proofpoint-ORIG-GUID: L1Ya8chu9zjFC9j206hBReb8aOo2KxWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfXw7aQjYrmF0Zu
 Sd3TI8R/BnSYF8zoX13NJnvnk5aUIi8nNBUkuvgr6OLfZXQAg7hFsT020mVT1XVZsM8DeXDxclR
 8q808aX9mSzItOWpodqs+ZpyZIy8t/yevJXXzo7LAq6aYJkr8+z4DEokg7ZVBa3sTGvMe+RFblL
 G1FqMlCHN40EFrQFpsmLbgTXY4A6QH5S0rV1pasgzwY32LRmdZQrUAe5lA9/+CMoWeN//SwC8Di
 ZBKQumZR5LaEUTiDLL5UODbCb4xxTstZ8NyoUwf5ZbkbPohj9KEPN7CIDn2KbITxRSlaJXvKU8H
 PXZjMSp/UIdVuv10/m3i3OE6EwfIPLJ4Gc+q1UiUsMASbfX3WQ6Zs+xs3dku4ILtpw955b3lnKh
 /tn3GLenI69NT0un/X6H4sW7eQPaaFVOPxK3Bh8tJ8z2jiZZZEdXY+GKzcDRphf6wN4k8ZvD5W1
 7Ym5eofPEaqV/sUZoJg==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04b311 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ck3DHw2mBQFJDQxCZQbCAw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=FNyBlpCuAAAA:8 a=EUspDBNiAAAA:8
 a=ntcFNnzPSak53SQFYkoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=RlW-AWeGUCXs_Nkyno-6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130174
X-Rspamd-Queue-Id: E7D925383C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-107400-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,apana.org.au:email,apana.org.au:url,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Bjorn,

On 5/11/2026 7:47 PM, Bjorn Andersson wrote:
> On Sat, May 09, 2026 at 09:24:00AM +0800, Herbert Xu wrote:
>> On Fri, May 08, 2026 at 08:11:45PM +0530, Harshal Dev wrote:
>>>
>>> Can you please confirm for Bjorn once
>>> that you're not picking this up and he
>>> can pick it from his tree? 
>>
>> Bjorn, please feel free to pick this patch up.
>>
> 
> Thanks Herbert, I've picked the binding up.
> If you need it, you can find it at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com
> 

I hope you are planning to pick up the rest of the fixes in this series. I can
see Kernel CI Robot reported some dtcheck warnings since your tree doesn't yet
have patch 12 and 13 from this series which have the corresponding DTS changes
to comply to this DT binding.

https://lore.kernel.org/all/202605130731.Gi7H8zjD-lkp@intel.com/#R

If we can pick the rest of the fixes in this series, the warnings would be resolved.

Many thanks for your support,
Harshal

> Regards,
> Bjorn
> 
>> Thanks,
>> -- 
>> Email: Herbert Xu <herbert@gondor.apana.org.au>
>> Home Page: http://gondor.apana.org.au/~herbert/
>> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt


