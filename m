Return-Path: <linux-arm-msm+bounces-96855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MSVAMJr3sGkRpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:03:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A0925C2DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB2CE3051A9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AFA31F9B4;
	Wed, 11 Mar 2026 05:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qdcld3cY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdkEx8Co"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52E131F9A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205399; cv=none; b=Uy5BQ1s/cDV4orbzmIW7rsMzq+Ze8AJMGbifDzJlY3Pgk3MIFcsQHQaNYWnruCxkheN5dtndAOwtGbjM+cnKgNUGtuIV2B8N0R30LprYFqrn7KXPFAzlE1y7rkXg89Lbqg+bx4DhSR+Bh99kOuwmqqgSpM7XPkI+C3WLy4LAVIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205399; c=relaxed/simple;
	bh=e8H0Xw+wh3kNLq/wPXj3gmYnFyaAHCTv7o59qJP51DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLGZ2Q50adDZUicjS3klEvUseovgxNysGGjvF/CedTzg7RvSoeOnEkyghREq5rBt0y7ENwGEY5PYNu6GdcX+4eRaLX3g7H+qvw2DsoMjA0j6NmctvWBl/EjvC/QR3rtHup9tT6EKyiuBWhh5OZ7hqqwHkXNzyXxShKglInchyRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qdcld3cY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdkEx8Co; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3FMvI248220
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0QC32ihlZ4NP7LPhxUY4DLpId8PCXDb46OZwe69QQY=; b=Qdcld3cYFEYTHWhI
	JGvF2z+AtXUDaIpXwbe4pIjSacdXGxt8mJ2b7lDYR9MsA8ldDZua78DDnycOaEoG
	aQn29Nun43M87IahQ3n9tdgcXa4tOJ9SelqK++RWONkwAzwakdE5d9/WYE1V9e5Y
	4t0DqQESN8H4aJ6KogrVL30wzidC1+d9SPXIBTTNqq4CoIYEFMqkN7fqfUkkChmZ
	En859WhxUnapLNyEOjisbxGWiBr478tF7hGyunWPi0yziZLubBuAa7g2cLl4tLNH
	rULbFApaiEOQ12acFOZB7Wtk6riUO5vxIWsEXkjC7mya4+3fMKQMWEG48rcMdNCR
	Y6++jA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv11xa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:03:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae65d5cc57so429165475ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773205397; x=1773810197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0QC32ihlZ4NP7LPhxUY4DLpId8PCXDb46OZwe69QQY=;
        b=TdkEx8CoNMvuUOfwP6MMG/Y6HwRCbpJThQLGum9uwi/3tMYy4raPVOSs2p4BwHf/V/
         SVljT6CRaNWgyLPjlbUtJ+4Uuosapp6HrRj2ePcHjE4p8Xl8P5DRD2nTYVugC+O6YHh7
         +sOIGln9RNs86UYUWqTQVPCCWdrcpw6jxrxR3LzDfIHjMdiA6FUJJGCAsLwIcuhkLCGX
         3lkGVDoQ8PfJoQo0oDqdI3dHwBBgWDQC2Vu7K4nJgf2/QZnz8VBwe/b02gniBHRjUV5m
         rNPxcS2djWYNAF90HN6Eeso0E0RtnECHOpDa4p7K3Qr7HTT1hCK7yDQn2GUiuXPcu4L0
         fHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205397; x=1773810197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0QC32ihlZ4NP7LPhxUY4DLpId8PCXDb46OZwe69QQY=;
        b=OIKfmGM/TLpyokgezZr7g+hnJ+YYq8c17Y+TO3UUa+uImyozM53VOeD6BUlvN4KrMg
         BocWXvdr5teGBcXhFeu7x9x9y+d4KpGmPoEAtcbZiq7LkSIXlXN6KHETBHl5QIX9vs8t
         tKGsJEGUSJ3s443NadSddSQLHB4KO0CKYKUTdUHzMNPGSxsE89OID2TAf9Oiwg1Sg8zW
         iXF/u3jaa3Nfd5guXxocaQjNt8wuEW3CsfJkp+NR28a6/qH4Z3pp3cxpciWbdKssbYDF
         pWQGhDJ3Sk1KoxkEqlci8+2yAjnl1VQbUCG1Lp8hw77oP/m1quYnrffRu8VBM0riSqFR
         ypcg==
X-Forwarded-Encrypted: i=1; AJvYcCXLoRxsZW7WR/A9LSqx2Zz90UsRpMDBJ/dc5u9+aY0JyCVOnGVQLz1DtlKnt4iSYqHLXpKshY1/CjmJoD8n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy71PaMU/Hd5pLSMlX2YWU+l0L0uu5Mp75VWZEt7R7YO5UfaIzm
	LDVEbujpYbxK0Ox3u8qERPEfZ0yAh47uAqgQQVOCwSK4WIbrk7sqm0Pvpu/JQNJ52NJZIcgFq3X
	55r0AH3BMfBsjjgmGYYl1erEQ19w+xPFxGzYQ4RzBitG7K2FIhlAZYmg2PmkMmFzn0Kk4
X-Gm-Gg: ATEYQzxylp0ZLMUn99WZVJIJVDRxTievFr8mnYR/BNyHsGqFPNijrGIGOqab48aSNta
	e18HUytRQSN/xPUWVG0I34zzcjdS3TpP3ABGpYHPm6PVL2xLbDnBL1LR0WM8mUPebkNmfF2j8HI
	Sawrv7AM0IoZI6bAWHO0DUR/YSkPpeNDGrMRdSCO2iK/X5iWFGlEtOfPWlR/VIC2W918QrYLKPH
	wwy5Z5MrrCcaMSbiyv132z8vZLRSO6RZVwbvk5aOKJPtE588f9BOMLY0kOwUZSbkMhODzjo9HV5
	nRMHnj13PJvb52JTaVKcnvNjeNKUPr+oAnc7101RH3ZnEU9gePIJ9aHq3GrJcXUDeENOXxrtDpP
	xd6dLT56wvu0Gi3Jnoa9mkJghh43DVCNVBo7yNljCAUDpr3/9Jw==
X-Received: by 2002:a17:903:2f81:b0:2ae:5745:f0e9 with SMTP id d9443c01a7336-2aeae76fcf8mr14505155ad.3.1773205396543;
        Tue, 10 Mar 2026 22:03:16 -0700 (PDT)
X-Received: by 2002:a17:903:2f81:b0:2ae:5745:f0e9 with SMTP id d9443c01a7336-2aeae76fcf8mr14504805ad.3.1773205396085;
        Tue, 10 Mar 2026 22:03:16 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34de7bsm12095585ad.53.2026.03.10.22.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 22:03:15 -0700 (PDT)
Message-ID: <fa004f9c-3c5b-45b4-8ffe-28f665671fc0@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 10:33:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: abel.vesa@oss.qualcomm.com, ajit.pandey@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        imran.shaik@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com>
 <af606d6c-3ce3-4342-bd5c-ce3ea28c6923@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <af606d6c-3ce3-4342-bd5c-ce3ea28c6923@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MCBTYWx0ZWRfX9043H+lDPs8U
 8ZUiqMRCQKAHhkj5mBh5ZdXRzH+dWBOW3abd3g29CzrajjRuzQSoulEPKYaxWjP9MYrnazhO0Ya
 oPmPP8g8tPliA3zi36JCQGysvJ2K10RaP7mhMyBD5Huvvpj/ZvACSJDSjQwL5s9lT+z6OYyMJUK
 xBoTLDPxvLNIuULr+WCz6fha7u+4/kleXxXxlXT4wbsQ3w8DpwLbv6oZxblLHKqn3ntL6e2d2ou
 uwXxG3ByTNewOJPVvxmBO7SdDmiIZMvCGd9pSoyUAzkFYYR5DAww8MbQnO4bBFKYWfzTmOolGLC
 AI1bc4y9wbeMu73LuREg7Xg/VisdW2iyf6AN59bIvdizrwtBLuOUPCt5wJMTakezbkFhLFzbbD0
 mXxD5chsKX1pRWo/qGwF4gTc6c/DnJB8sDVD6KO1H4QYsBhzrCx2vVMxAnEpLuiEzpdiln+amEL
 d8zoZ7OZacIVH1PBY8Q==
X-Proofpoint-GUID: QPqtyZ4zkEzGNhK0QPNfDsmwxn8WG-W6
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b0f795 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4HF9s9dolvseeuFZ7A0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: QPqtyZ4zkEzGNhK0QPNfDsmwxn8WG-W6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110040
X-Rspamd-Queue-Id: 19A0925C2DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96855-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/10/2026 7:02 PM, Konrad Dybcio wrote:
> On 3/9/26 11:27 AM, Pengyu Luo wrote:
>> On Thu, Mar 5, 2026 6:40 PM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
>>> is simply a separate block housing the GX GDSC) nodes, required to
>>> power up the graphics-related hardware.
>>>
>>> Make use of it by enabling the associated IOMMU as well. The GPU itself
>>> needs some more work and will be enabled later.
>>>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>>
>>
>> Hi Taniya and Konrad, GX GDSC stuck at 'on' on my device
>> the raw register values are
>>
>> 0x3d68024: 0x00000000
>> 0x3d68028: 0x00000000
> 
> These likely indicate that some clock or voltage rail is not accessible
> at the very moment you're reading them back
> 
> GPU support for 8750 is not yet upstream (and A830 is somewhat different
> vs the supported A840) - there may be something wrong in that sequence.
> 
> I heard it's in the works though, so you may be better off waiting a bit.
> 

I am checking internally if any required clock is getting turned off and
causing this.

-- 
Thanks,
Taniya Das


