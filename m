Return-Path: <linux-arm-msm+bounces-102276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH+RNkUY1mnwAwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 10:56:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BCE3B9654
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 10:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CF7130055EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 08:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A615C37FF65;
	Wed,  8 Apr 2026 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZ7QnZBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fr2pv3zR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E029241CB7
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638575; cv=none; b=a9WF8u5aDW2+bti32V53FUA9nVXbp4S/7CALQBiQPtQhpqnDhIeDUDLinNOPUk5K7JVtzk71Rf+IG7BNN0oyn2DSiNrKFmwm3GL9fnp7hxH/+6rmyQXltl6kLozZcumQM/b67i838uGBgeH8lRQsbSzVnXch5MSscOi088VcS+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638575; c=relaxed/simple;
	bh=eYiGtWqY/aeFFUoE6DN3f2/d86U+6lEN8ErqK+mx1DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tmTqzOWDFSKa2SlpaV3Rg8OblcB1VTE8Fl9AC3zleCvhb0sSTNCmlQUDVFUnzqBkBujcYh8N69ELcPCGNRKXAyU5afvrBQRSo4kl42/Bq8gMNfrohi9wXl2Dwnx9aSNYgiQeFAKAUpvpCtZA4dcEoxgt0DjbwXaTm4wMVnHg7KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZ7QnZBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fr2pv3zR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63888HU01796076
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 08:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8Orj55AJRLp4aqTffkLv5tWJlv+Gke77k9Hqn7YCKU=; b=ZZ7QnZBs+EhrtxnZ
	u/pOUUB67by4qmXmld8erxSJFYajgYfrHJ/rZ+kLT42y0uOSbgkiMPnZm6//D271
	J00dp1C+uFOkrVVMkwvU7HxRQGTFL3gRGWmJhTiEhXUULlnUsL2edLTheOQqxZzZ
	Y0mNZobSehETpR4cCqeVGiMbHWZzIMS9v6TZLAz9Qz1HqdDWgpLf5LSXw5+3bIvV
	B1jaKukjKhCsCQ/SSYeM3LHQNPEVU8Mj6Jca639qFWzXc928wEw9Cqhn3OGjPkJ6
	EfChWnnhF+XuCACMKdVaYkkvA9GjRWzCn0HoquKqxmouEMS8q/gZ7s5r74Yb53ok
	gHy/Sg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd51db8ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 08:56:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89e9d327913so23752246d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 01:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775638572; x=1776243372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8Orj55AJRLp4aqTffkLv5tWJlv+Gke77k9Hqn7YCKU=;
        b=fr2pv3zRBS3IrcIIp589b+8WT4Lt7Lnvmop3BVUB9a1UkMaqAmTFmo+iuLUKKTQ4V3
         2emQw6fvVcj7z0xuN285K6fbLiPzngvePDi7lnUj/nn4evfDKEZimQX9ESOedzcg6SYt
         0YWRWsEcThA9TkGGawuKYO4WxYdTKGoyzBQQxMTpxGOAukeTOajEc5m/OBS/BYMk3XnI
         6dFIiS7MBEtA5On7Fnpnsh61L7aXKBgHtVBQSdA4ojGrfw8ArV740EAhCU4MONQKKMy9
         QzWx9oiPJN3dBXEb3dGDiNhc3blx2EICysaVUIU6am98P9Zgf34Uh2J/6n/enrWI2oXa
         U2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638572; x=1776243372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8Orj55AJRLp4aqTffkLv5tWJlv+Gke77k9Hqn7YCKU=;
        b=CbMdljJf2WIeO7aZhuz5muGR9xi9ulOWC1sFk0YNfu0wCCfRs2bCBww4idoxmMhsWZ
         XoMDl0IhkYmmYYqUZ+v/YtgqWYopCgtzZWVI22AIeJedRIYM7F41V+JSv+pDAnGKDAKv
         d477+l6qBS3oRJOGxsDPwqTTIQO28yXi/C5Rd/exESKSA8oXdk5gGG4PaBKKQ6CXd1v3
         pL24b6BdxoGj9COgLzh9Y2w1iVMSrxzHrmx8nyhz6j2rjPakn2Ilf2yV+Xm81EdzBO+S
         nQijgmghTvgeGdKxVH5QSEyMTCm7BstjPWBRZPh3Fc0nw5xHWDcH0mcd5QXNitSMTy8u
         MZsA==
X-Forwarded-Encrypted: i=1; AJvYcCVnRVJTBvzLWF7ISEkupXU2aZ0Dy33MV2VXAk45ls1A5TtIlivS/e7hoZ5QmbklY/MOg+b3qHM0nYWxrVol@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7RZ4IsHILEISJw/fgMKnjw55/4BhZ2q9UdXra7+s1AZKDr8Eq
	UJo9mpCmUicO4yPqCT4RCosthGdga9+MItNqw+x1R0Pdohu/sCdrUEWLTJldS17ml8pCfFjV/Td
	O2UmLR0w2dHhiFRMilmCaBBbf5wVpK2jhKIuLJcGOkFQKihxtgecMfLF8K69Tfy5+jLHF
X-Gm-Gg: AeBDieuTwMMlM2WCCiKeHt1PvldbDRrN32I6FGIbVGUytnkWJejsDhJOIvBzBo+x+QW
	qGSP3b0tQryWThpF0XqR6s2h3c8O9vy1iBOkPDX5yRiDb/EfS9zdP2WRvhBUhdS9WT6EKaIeXzp
	a4xqhgKdWvyma+E+NCiF7dOLXjFB+VcvZzJB4RoJvst6RmRKu244wso87qH1k/+DsaybJFCCREZ
	Uv7L/lYsfb02kjsaKypgcXqWB4YpTcCrwdCuSM0msWCT8HD8o7yiMyMVSMDeiJGb/1I1mNvBZyq
	IWv4q1X2KuCuRGLCFc+kiS32OuzLvAxHymSXBC5if6z7w8swmCONRhG0lkvOUzDL2cCk13K2hiV
	47QQygorBoBOHGYWHKsjMl5tI/mJMaDiEDBU7H80wzYnizk0eYbeZule9DLTehZO41avyxI6HX7
	qdBhI=
X-Received: by 2002:a05:622a:7292:b0:50d:8667:6829 with SMTP id d75a77b69052e-50d866769d0mr92871281cf.2.1775638572244;
        Wed, 08 Apr 2026 01:56:12 -0700 (PDT)
X-Received: by 2002:a05:622a:7292:b0:50d:8667:6829 with SMTP id d75a77b69052e-50d866769d0mr92871101cf.2.1775638571868;
        Wed, 08 Apr 2026 01:56:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm4860879a12.16.2026.04.08.01.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:56:11 -0700 (PDT)
Message-ID: <4de63324-2f66-48ca-be1d-e8f20e8727e0@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:56:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add default GIC address cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dSl06TbSyK7imQgR0HKqHXqqHMRu5R8M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MCBTYWx0ZWRfX6/jBrLwjX17L
 tmr1WMjRPePE+UVhKl4nvjA5QG3ThShl6OIBCC/pjGBoqWHtFoQfT8thL6RBrcLzb6Tc5t9oKjw
 URIZ+rw0oD6Ev8bhLyrSX+I+0ZnYegbbc/VUGEB7dyPDicB1EOdlfVrQfKrB/D3nxq5WFkxljZM
 DVyuGbs2zPZb/C03lDXUkDCx+h8VFWmnQ2OKaQ7RFVwwg7K9Q1FosyDWS11kWseBbYQ+NsONlOx
 m5/70Zd5Bp16zlrRjKm45hI4iRcyz9k27O0ouse+jlROgY3ObLTcggcQVl6rdWQBrxBts3QWKJq
 Zz/3chOA3hH4P19zuhZzaEkrWV4dLJVp6eOsFsvaxRszZH6EamK0rM+GrvU4xvfXPZcYmeZMqFT
 x8FL/+Gs/H6O1Ek8jdUpJO0YggVF/6ET70ohvWO2ehhWORJwdm5W1a+YyceSqX6K+JJyFgr5FaM
 buziW+PZ4g3qL3RkJvw==
X-Authority-Analysis: v=2.4 cv=AcaB2XXG c=1 sm=1 tr=0 ts=69d6182d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bid7TPF93ZdvqAF1lPAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: dSl06TbSyK7imQgR0HKqHXqqHMRu5R8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-102276-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,17a00000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1c00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4BCE3B9654
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 10:15 PM, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node to silence W=1
> warning:
> 
>   monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map:
>     Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component 'parent unit address', which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0).
> 
> Fixes: 46a7c01e7e9d ("arm64: dts: qcom: qcs8300: enable pcie0")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Fix for v7.0-rcX.
> ---

An alternative change would be to describe the GIC_ITS

but for this warning fix:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

