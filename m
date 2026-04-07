Return-Path: <linux-arm-msm+bounces-102092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGBZKOrP1GksxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:35:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B4D3AC1D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD0BF306D1F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234B33A1D0C;
	Tue,  7 Apr 2026 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY0ExDQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDamxPyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B639B4AB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554368; cv=none; b=IPzffM0WXB1VlaCwR+kDEXWkxqJQv4Q/FIHFZcW+KAUvCp8t2JC6KHpChAlKeFvNdqKuLczFmNkeTlUnCsFbPJZBLksJr37HZSoL/8ykfNbCHIZsvMPppKQzSxRC8+uNp/DlvF0cEKAm9wZvINnkBaq+mZDTFooPMw/0gHyjeXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554368; c=relaxed/simple;
	bh=PlqtCBXD5lGG840CbvlldBm1Rc4lIpzRivGNmCMQE6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nqd7n87ga+AeOi+2iG7+qsgG4Gv68DW/g2ini6cQ5Bz0p6F6l7nIoL8PoS5968YxVz3iY8LcKiSRrM8iiDSmLTYooMdMUc+gBSRxh6DcrdlnQGDOUVrTKamlyesLjF7giHhrSaXA0qWs1mybtx/dFNQVp0h2me0imQgrISmLS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dY0ExDQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDamxPyT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376AHWo1404166
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjQY31qiYnxDh7nce3yeQEC/gszOekVbPar7JZhOSNc=; b=dY0ExDQJHCQbZ8u7
	3JbI2o9kSMtRvT7cBgvx8NYRYEggCLaDoMKUg7s/yGDITbJBBdNBABTHB7fhT123
	7kjMR67LzfFbGXBmSJ0pY27Kt0ofTLTAEbI9iirdzcnL3Z/vnmMJM71VheUytde2
	lRGoLB1L/cJf79mN1gP9g1uv1z4UlWQPqqQtgsHZxi08ZOK4uDctI9iL/MkxnYeF
	j1wCCrgJlyvc0g9viXa5/1uEqdO2jBG3dbH1Wy3RgtgoVRc1xwSg8DMZwyw6bHCk
	5tXkJ9p3+Q0sDI1lVOXpcljCq8KMkSg/EzQcXkTN6OP80MHJTQ0dnplefnX95FXf
	eOe0Tw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8a2pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:32:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b27636835so17051221cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554364; x=1776159164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjQY31qiYnxDh7nce3yeQEC/gszOekVbPar7JZhOSNc=;
        b=EDamxPyTrYYtts6eHRWDXIJ7J/sVcGfVJyh+vA7W1kBHljcF/TW7aj2C3TkUnvv9uh
         QOWljxRo+bw4QTWHuVS8gH3HhYkQ+qzM5O51qrezkP1TQhVKcMzrjcgKbx+lEaI525tK
         iNVz87uyfTt1jcHNOOovQBHrFUNZuUKVOkpP2G+pbCKb7dgLFWsycV5DGzBGF+AQQIKV
         LiA5AAf7elgrKcwUlKaXs35SMb9S4XpcAg5qFoLcCBkkEhaVPTOLjDI/El+8zmM0Wp87
         EwK6V7PDTIHDtV787c1SX9Syqd5h/3i8xcyx837BbAT+TX6hT8JkrF45pmi/ynzh7I5f
         52Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554364; x=1776159164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjQY31qiYnxDh7nce3yeQEC/gszOekVbPar7JZhOSNc=;
        b=VK5d0ROaPrtniErzfgeYBWNB1BcPkUsuejAyHZZv9+QR9ZdNqLsegm0DoLQy8nHY/3
         BjI23hrnk6puwOAkoH0v0tbqFAe3oUWbE42dYnZMPcxV9TTkoZr9myMRADNOF8G2lAOV
         AuUFQi2tYnpfU23sFwvkL/iABsZnIyzSDpgpU4uyBGBWtXOGSvIPdLa+N8TXE8ETuPee
         uuhdoqilkMz8hGjrU6LCGqjjpdPeGCs/4LRqE3XriRVhzwQD39Dtru4j0lB9vsBvuBIz
         lRsRHANzl/VU7MVaqZMGFDbewdooV82NaId2xqeHDGvp/KnbNYb/O12tU4FHDV6j2WG4
         9Nfw==
X-Gm-Message-State: AOJu0Yzs1FaY6ZVc/T4dqNh3B2AqmSc5fc0z1fqdvpfqQH21hY914nh/
	JVb4CAlgDOthIp2wMMSJjmu8TwOt3TjeNbeCfrAxW4H0OMOnGeQDF3DHNNTbze0n6NskXjHei54
	KqRIGv0ComfnEHyfmHbmf9ycOgxN/RmWv7A0+g09xvq7okbKMj5uhTyns5Qp5pkTvDreP
X-Gm-Gg: AeBDietNwhaPRLHm8M01EC/mD33ErFXnkQ9JIkK40PPqWzHsu8R3EKvbj9B0GOA/uDr
	XOijxoBDxJSILlEae2ZHcdQ9PE/9KJTKQK6nFcE/qeeTpj4hSc5Jz4vzTzDgqBDXOaS/Xb0PO99
	OMQrMHIK43paiEo9gKgHh3ZOjw3IFuripmii9j+e4O8U7bf/AjnSE1VuIoc9NtQUiWM2wRzVM+P
	1Rpuj+viMQ99Pf76wO1JWiwg/B4O+GbTubY60J2JszuaLiwoydHJarPzRX6Mm+PPfheGi8XsqYW
	KLGbVtNBhsjemGZUw9bcZlCr1f+O0xJSSZxw4vYZixrc+P9D69X/FmlaCSMSKj5RJ/bJm+ILl/d
	fwa+skEJD1WNi7h4iBZ2+Zj38VK93IHp53rsBjTC7Ep5+AmOjOB6QnPhCYUYWE3YdbaMpfjiINA
	MoIVE=
X-Received: by 2002:a05:622a:53c9:b0:509:219f:8e34 with SMTP id d75a77b69052e-50d6260ae67mr176221121cf.0.1775554364458;
        Tue, 07 Apr 2026 02:32:44 -0700 (PDT)
X-Received: by 2002:a05:622a:53c9:b0:509:219f:8e34 with SMTP id d75a77b69052e-50d6260ae67mr176220851cf.0.1775554363979;
        Tue, 07 Apr 2026 02:32:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca94715sm548707266b.21.2026.04.07.02.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:32:43 -0700 (PDT)
Message-ID: <18f146bf-155a-4266-9f31-b75962ed1724@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:32:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406174613.3388987-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uVGrSVcPnN_sq4IWS0ON1RVGFbVz0nl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfXzuuDb3waQ/ip
 OED17dap9jak69xlDfYhVfcawZwhGAKZSyFZwQuHUgaNZexhslW9YUpN80DsdRIKox1XknxSAZl
 VBHiuLvt+hN8Zy3p32xp6sxzZc3fU7X2iljwMrOCwglR0e3aWhqngW31lSRwv50CQuftNyX+bXb
 BjZz6lrQ8MBH57j8PxnqwT1voTpR3EXeBHfp1KPAhqumvR9vZpKTieE8l2GhDvONuFZKdctIHPD
 66B11PjDNqrXrGDs2/qIWgJZ1poFFNZx5wRMOpkwZTTV5ObW6ONwaJsWFtufTUUnntxi1irLyP7
 g7GcSsdl2YEPFv14Dna87abXScPQ3hnl24GdGn7g/hSkB4zURXkkiBaMyGpl2cpStoRk/0Fet6n
 lCzzfhtLGTzNfh+Ki0HuyMOfYydVlOU1PBgET5bPEeq9dKY+9UuCVFQI5tXoRW/IZnsEF23X5q8
 RR/j+osb/k7PKcOrk0A==
X-Proofpoint-GUID: uVGrSVcPnN_sq4IWS0ON1RVGFbVz0nl2
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4cf3c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=edOAiv4QBLOMXHKBau0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102092-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13B4D3AC1D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 7:46 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Add the base USB devicetree definitions for Kaanapali platform. The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

