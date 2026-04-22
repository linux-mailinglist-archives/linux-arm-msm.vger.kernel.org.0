Return-Path: <linux-arm-msm+bounces-104054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOh1KUmV6GmDNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:30:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F277444020
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD7F53020FC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391333C343B;
	Wed, 22 Apr 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/gw3NyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNVHtjiO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845E3C1991
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850153; cv=none; b=U6zGVhXH6ZMK6PjX/KkZGvp0WP5lXY6Mg8fhN/5qWLs5GND9ZKXf80D7O1MLhGxbzPvLw1/v0JKw3TtS4PcdHWOC9Jk7pSGcMAu/VOfv6SmnFJ48oFDL9Z6+IieYB1hs5AA2Kp8NudNA60F4ajnrkgrKl0nL8DVYK5+WItMi75o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850153; c=relaxed/simple;
	bh=DYoHvvvz8DI9As6dB9AwFtTr1i6c5D8gJpOitjuge9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERXS3am4lv/qCEhVt76pGR5L9hwkagqyrqaTJ+4Da5S41hG3tQgdgQ22BXphZYn0t8Vnfao71K/peD+ksx3IRVNYjjO3rHtu/gyP+cBnKpoC6VjFJAgHHikBCoWryikVQ+eXG3QdBNMWlqwkl0kiznSakz8siPMD6BWfvLt92cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/gw3NyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNVHtjiO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99DoX647290
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGX113fTh1fhm/h70xcLYgSaHKw4rRJELjaFmfCqZIw=; b=E/gw3NyY8XxZIUgw
	nSZ0MlIFSCQZ4m+FhJLALiCt/N4TvlG69eJIZKhgH0+2SUl1JQKyo3PxW/Z580Js
	Zkoqf/bmH6eDK/RI6CcGnFLB7YGfvnLTirhXrxzEiHI6MJjbWxpMCNpP965S3tj+
	qWCbRjnuCMl2qY/Pb40T4tz54NymhfR22bjTNnRXjR+W2S8Ks0+XKMFxT96IHEaw
	WmfPaNJZfzUutYvi3zbxrRMeoluZSEvqSuEUzZ85D4AXv54MN9xigMwJqU+LXDub
	pV9K54CCC088oe6t7IqzB21XElGi5rBwNEX1lTIbyJPbQwlLhmM3AOV4F4PIMTjB
	7iDKwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkap2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:29:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso49225411cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850149; x=1777454949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGX113fTh1fhm/h70xcLYgSaHKw4rRJELjaFmfCqZIw=;
        b=FNVHtjiORowA6nVBmyVh5ne/ky3NUQfCoL+DBym0o+MzgRs5+b3rRPN3NLmlxq50ZH
         pp8zILGcdQqC03lavt3tJwOFZDZ1EtgpIpyPycuqeqkqemduwvoaRMO9kNg4os/rbJu+
         CT2jtVCWXpXywLrXmKL+9Rf1Bh8mQF40GxlnZKz6wSxGw6io+JsaGw9ocNak7xhpRIQK
         sSuH8q1ZPIYnTUx60w3xvAm2zLceCBbN6U3CNo4rZzJPphyPVD19CBYB3FYk66Y3Lfxz
         VJuiNDkfcs208F/fuDP/htPDS1TsSyLwwzaD50IBiTb2BDO42X0/gZ42RB10pQoXwe6h
         RQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850149; x=1777454949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGX113fTh1fhm/h70xcLYgSaHKw4rRJELjaFmfCqZIw=;
        b=MeIpVkaN9myiCA5FcanafwDPL0nrDJf93+o5D3cSh5QezHj2MjzLayw9qbiMUbDkm0
         /u9A7Tp1WJiyq0JuXw1PmiMghw4fB8vR25t06HRzIBBySpfhOVPQjF8l6fHpy5k7IdRY
         9jWzefeyYtUJyBw1ICIAs2ls7K4SHLxMiyg9IE+i43zyCy9cJi2ndFEKkgkmF09MShmr
         eqItdRM/EqwA52ahdNYvIJ8TBtM9mD0dV+0+Xys8plSVEvYq3xD4TBd012bJrLoZGgh4
         Q9YwpMRaQJ6mSs0oqZS0q+pIhqkqy3CDQRRStR5FugW9zvxRp7FBZYF/ywGXB8qWb0bZ
         uuqQ==
X-Gm-Message-State: AOJu0YxIxBflcaCVfbyZcOSMnktUKnbbfiZ9uoEuePdIlZU21YlT+wAg
	tUnMaGxW2hlHTxVnK0YSVXDrCjqNr7jgQ1lTlFt9fDCt1VEezu2RhCasApIuI3fXouKC/KVO8HQ
	x5NJt/W1CQevkVzqKUYw2aXcmer5b50pLttNV7gVvAilr6e8HjpE4guJV1K5vJwcAN7QJ
X-Gm-Gg: AeBDieupzXAeum3TzXBghZuAP9WVsBnm4rb52fd2ZTOD9HPkZRyGAD7xXOSglE4W4kw
	WoR1J36PX5IfAilQ+/DWUqTo040Hha8LUsMEkXa3oYabTxCPRdhqa8J5HA2hUJ/dvVv5sOqPwwF
	7BnfP2FB7AoZL5NX2q0X8hFJgzlcvXtYWwC/KzSNOGntSy59pnGjpD5iT87ZmaqLmlfvkwX1Qw5
	8SXdTOFodspebFOAXaPBvCjsdFuVQWSzTtjyPhzf/mbISZnZU+jlxN8ldS7eIcuJ31DC8Ikpbp4
	Xdv81VY+PXEsJF3opZ5MWTSVtX9WVTqetcIkQ5XScBXY3JWcRiCTTI8T8Em1hrrZaGjRZhTQYVm
	SOsb5smY4qg0ETNErSqtX9/UV6V6AemN0HLysUBA32mJYRSPMQUigrUovrtVIMvX0j3Oc6dQCBF
	RVMN2waRDOtz4rsA==
X-Received: by 2002:a05:622a:22a8:b0:50f:af89:ff33 with SMTP id d75a77b69052e-50faf8a1556mr82563921cf.7.1776850149052;
        Wed, 22 Apr 2026 02:29:09 -0700 (PDT)
X-Received: by 2002:a05:622a:22a8:b0:50f:af89:ff33 with SMTP id d75a77b69052e-50faf8a1556mr82563721cf.7.1776850148605;
        Wed, 22 Apr 2026 02:29:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455043cdbsm530351166b.46.2026.04.22.02.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:29:07 -0700 (PDT)
Message-ID: <46c20e58-0e2d-4f91-8254-502e5b962299@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:29:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: eliza: Add display (MDSS)
 with Display CC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
 <20260421-dts-qcom-eliza-display-v2-1-67f8cf155331@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-1-67f8cf155331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qdk8wXCbyHWd4g1z-1U1W3QFi8LchTrI
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e894e5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Xm-JAFNNr2e8P9nfQOgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: qdk8wXCbyHWd4g1z-1U1W3QFi8LchTrI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4OSBTYWx0ZWRfXzO2TkQAhEDM5
 cKJ4qtbLalca7AkafhMAfglPwExNd9I0stbx7cvKsz/qCXCJ61aUkgASAtBthwl+evhudXjQuyP
 gNcHpLlYRMRE+RNLuQlxSlxQMItj6ajEmA2VlNJ8Nkm6XV372KL6iuYVqlGfPtxhh4KTD2q0NHk
 A+Qk5dDnvqEYT4Dj5WAup2EpumL+uw9q2wG+oQUaul1DDvSxbhw0pe3/QNbpwYWfECI6AMnjs0C
 TltmnorydBLjojAgK5nH7ggYKdqVRCqgWq11MSYwugrApnTyMw5zecd3ffC3lhV0pLLE8FTOUpd
 sRDXVrWJlLo/4CtsntSo7IpcvpJNgP2utAslR1REMsLBPEMkeiyyGIv75NAIoOhZDbRzlsingUW
 uubjU92HFCnxgvlVZ+SOqqLz72JhSzKvhlzgTa2IC+VGVu1qRXKCRUw4M6t59bCiBsSGAtAkFNM
 yU9ypBOAlDknKLi2n+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104054-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 3F277444020
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 3:45 PM, Krzysztof Kozlowski wrote:
> Add device nodes for almost entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Missing pieces are HDMI PHY and HDMI controller.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

