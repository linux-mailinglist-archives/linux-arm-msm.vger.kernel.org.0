Return-Path: <linux-arm-msm+bounces-104056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPKHLLeV6GmDNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:32:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD8A44406A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E9BF3060DB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6AD382F24;
	Wed, 22 Apr 2026 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fa1tYt5x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gThoFbMi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F6030EF90
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850238; cv=none; b=BpBjaH3K7SL0HurqL6miI+ldfQOsAExuD/vBfY9v7gOOXBUvBGebD5IGer9oiJ4le62bhyWSFLg3jHdd0hG8iiULuhsG0iZeyitAGKHahOUfAwm2hkO5IB+MYFcyqcDt//l1Ytrk4s9S6Y2xQyeO8Wxoydx//9LvQNxqFZUppr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850238; c=relaxed/simple;
	bh=c2pS4mKGjx3625rQXbCOTc3mNgXwRO1UBt/eekqC0MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRBudBDw3of5Hi5bQYBKbOwXkFv7vbYb/IMjyBGm9XfVzF0ptokdQuBeqngEoUKwvDPzA4aYPHHXnmFfIOZWOOJBGbzdHdseRmkqGFzfkczQ9qTSceYj85UttyixtqZgcM4waNJTqScGLM0QaRUaLymYn9IhXnMVD0+UU8jVWHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fa1tYt5x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gThoFbMi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M51g9S976178
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5oJ7HVTqi2wqyK4OJxl/9qyr3e1A0ArpNezF/LUf7/0=; b=Fa1tYt5xa3GxoTNX
	gQmaIy/cqXb5zs702M/NfOYMONVrmiBF2o2IVfbRunVE3kDs3a1wzmYAFUtVhGPL
	VQmLa0y+BSLHd9mYOEWkD425jRAycTL5K90gpBM6DkMF106+m9Ag4yynbbDFuJYW
	hliE5iBbOUqIaTYAze8TDhlCqGMaUma2KvGaqhevAg8hqLRGCbYzQJDhE1IfEHZe
	Op2HRQHrd0fc/KFGz3sYTzrhu5N7qmZEKy4NF3KM6YcNz19fsS+l2CQWbW+fvlJy
	Di1aQp8yUgDuEbzbDO9Oa5Wnmxzx/3/3qIt+n4EKZDa4ARCVdVG0pqdCY4lZg5cv
	w+sA9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeneat8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:30:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954b9b5da7so14479436d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850235; x=1777455035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oJ7HVTqi2wqyK4OJxl/9qyr3e1A0ArpNezF/LUf7/0=;
        b=gThoFbMiN9701SfCcebPZalfzhPWO25LmrW/uM/fWVkX+95mKPWDaHB+SDKWCp9LKT
         1tEfZjPDU3XRW2qFgy1/nHX30pzJS+cdyGhgC9aBRHPSEeyTH0Ycn7ojV6gEr1keTJFT
         jNtS4klyeYKUNohWiPJ630sJEOb+jzZsAlcVW/DXaHjTD1NPee4L6x5Ivla/vR1Ld0bX
         yXBrvTFzCMYpsc5nSq090fx7GoWTOdopvy6h8d6oxA6gPO79LPY8D8Nhgj6gpVh26IQA
         BQINInQaG5Zbp0Xirugasy308hw0nKczu/+DStGoGIbu7CSE3ddd74m2NEicB70LOTzF
         1ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850235; x=1777455035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oJ7HVTqi2wqyK4OJxl/9qyr3e1A0ArpNezF/LUf7/0=;
        b=LmSXkOCwJZ3vsJAgxipA5Ul3Ckp1S2NM4txwEls5uqMVwIJXZtB5jRYeYelzMsULxn
         O5TexXJUimKTOpAYhZ1veJYiTGHvC/+htWZRMu+PnzMFfVIOmsyj0D5ISvIA6AkADMzt
         +3yvfLXf/qabUkGTRqLDPtNqiytSvYS4wx+yl74goj+zJUTD5yfTrcpwDQ2CaGB/XDCb
         1LZEyerakYCdR002xY8DLXjw6LsfeDZ+AXIrzQ54erJ2IZGwhv1l4SlrmzTkrvobsXfq
         4OocoOCPjEZHBGYsoR4yjcbi6HdwSabkGSEFcjz2e5h580OuBtMtbbstC+DAfhm5vmq3
         lr/w==
X-Gm-Message-State: AOJu0Yyh21H7vAKIh+oDcWWkLowsJOjVgHTdQSBPnaMJGzyKZ2BLnq0B
	/5ZLg2w8nUmnWlANYFfLOzUMNUIO3x1HKB+ai44P+1ibfVsZCZmsjWu7E3xbsoTxK7mU0vcLKAw
	r7hSOkiv3/mZ4uXQRFT4XJmPEtCT16IOdDNLI/YPnSnhVTMYI6/DEgCbBx33qyG/7zHPWgupSj7
	7z
X-Gm-Gg: AeBDiesFldqhOnQK7NJDISgkxKEhD7JfUOkosAemRNMCEPupKaa1em4Xku5rfs0wHI4
	Hznp1/Dixg/qSeuYktt7hLUBegfv9Yi41pq/Tj9fKmP8WlkBrgVHd0HthG9SCfwHEf5tkE3yfjj
	+hXNGxPazMmxI/qMdd/GNx7gsQMM34pqy30LiwXGPL7I94r5uYno+IlKDwFPkysIg2Nqtoh+9D+
	/W4e2wlM28q9tMQmRapsamef3CMME/c4AgflPuOjN0sTEikAmQHBV3fixjmU2rt4lqdGzFmIHiW
	nq9dA1mY2nPIgzVLcSGRjCi6gwXSPEFU31jcw8c36AA63411PgTzBkyWAi94dNIDKveUyku8iHM
	4Ay2fCVtFMJr3cjrZaHsdiAsE2JxKUOUJJ8jq0SqU4r8THYA60h8/8DnNNX+G8FcpN0HsqoXThE
	uwOuw7MRjWJjU9Ag==
X-Received: by 2002:a05:6214:29c8:b0:8ac:a833:a22d with SMTP id 6a1803df08f44-8b02813864emr258564436d6.3.1776850235549;
        Wed, 22 Apr 2026 02:30:35 -0700 (PDT)
X-Received: by 2002:a05:6214:29c8:b0:8ac:a833:a22d with SMTP id 6a1803df08f44-8b02813864emr258564076d6.3.1776850235074;
        Wed, 22 Apr 2026 02:30:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455045898sm522995666b.48.2026.04.22.02.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:30:34 -0700 (PDT)
Message-ID: <9b785524-4940-426c-baa7-22a7852f8109@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/3] arm64: dts: qcom: eliza-mtp: Enable
 DisplayPort on USB
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
 <20260421-dts-qcom-eliza-display-v2-3-67f8cf155331@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-3-67f8cf155331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5MCBTYWx0ZWRfX8pldRYWvhmVm
 bZbAdJcPw0/+m3s/V//eIPCyTZBHVDr6EkUWL2p13VrgnC4Oxl2wg0Xsw/1j6Ve8/v4K5YSkpjG
 pSO1xI4X+nwXPStYRgLqzHkIGa78pI1ZZrkaRmbOV8wwsJWrqOUbNbIocmCfh9qOeUdEXI2T3jx
 OicfnrnD3Qut4qcjdVqNQj9aGtuW+K2NO3WGihfDnoDe4lLbYHINioHvAltY2XUuv0pxC8JKw1A
 E1Xn2e/F+SPzGCMkpUlDw02Zbxuxf7CDN5LgdFQE5kluFD1xc8Fien+cvbr5Sndu9HJBhpESGcA
 csBLcerHFTIdp445MrZW4EJavdf/bVTymE8GIceHL4KcBWJ04aRcshWt8zJUJrtzBZlUfyWjrpB
 SBiZM/JO4tzszDWxA472Pd/9/2kOXT4ce2vrUAWy6Ml7nzESwDtpHr+QnUGMrYwHbx8e3nsJXiL
 Fy0I4Q6/wQLXEOAP7oA==
X-Proofpoint-GUID: YhQ0y304IrvGGEKgukPVSfs-sRxuLcub
X-Proofpoint-ORIG-GUID: YhQ0y304IrvGGEKgukPVSfs-sRxuLcub
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8953c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UOlMPMX7TREU8u2qnZQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220090
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104056-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DD8A44406A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 3:45 PM, Krzysztof Kozlowski wrote:
> Enable display on USB DisplayPort.

"meh" commit message
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

