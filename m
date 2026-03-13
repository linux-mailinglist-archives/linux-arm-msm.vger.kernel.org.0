Return-Path: <linux-arm-msm+bounces-97520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCUVIagXtGlkgwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:56:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 453A1284594
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31A473084113
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4E030ACF0;
	Fri, 13 Mar 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ah/0KcdR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tpd/iXln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA932F851
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409452; cv=none; b=Nzi/OJXdwubjIaCjGe2BmSQsrOHHYWajntBy578efQBWn1rlHAd1pL83DifhAUliBU5zaicOi1S8VlnVWRMVz8Wusv0s3aCWJUudEFUj7gcDwgyT8FKqu6wTwraBlhwuKYmkVRdGSVOJbB15Nr5sRztZeDYlVgVLPYtinCQkja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409452; c=relaxed/simple;
	bh=ha9Bd9A3J5ta9q5APvG9XRiWKfdLkqcg+Xkywh355/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qttsejeCPSn5O5C03es4fPZ/m3+8wBQ+L5bEOhQY/L28m01vNBjUjcWh+fj8ZZLiT9zHWj5g+T8RhnJZoi2AfBwF9cb3/9XRAKLqrEgKU2/SAja8RaZ6Oq8LFFNKNu3292Qpx3LkMRQ0lav6FhKR4ycYOy7G8WdjJaiNMj3NA5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ah/0KcdR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tpd/iXln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JLll237799
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7h8jUUtOMLoMOAauH6/3SgpV
	v/OymlnTWUMqYmVpR5w=; b=Ah/0KcdRjBwXfjauutf8xsmbZp6K2nVE9K/2yORt
	B4xPEnncNrKBJMDHZLSUpKQRanVLDMb/xUNaUxAdbH9aoBq5mBdlGR/QQhiFw7fH
	nfabhoJ3kK8GL+pinFJA13tQ+x23m+EwLSfpn/RRl+nXlkfLDw/Esw27dXONTfAE
	KgJLf1cfUjMSAJfw+efU0ee2jBe11/0nCYVSw9SrvaEftOsgeZEGHsUWtdjyxFw7
	kxzWeAf/L5BGcCiZgJ0igcWvDCBRiCBBiIA7znEZ6T+ZVBOEVPMjvQmpi/KVvMJj
	NNDtltM2/7uSgz82jBsOWCS5r2qwxksQlvN88+clb3cTsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d9aum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:44:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7f6ac239so1376393985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409449; x=1774014249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7h8jUUtOMLoMOAauH6/3SgpVv/OymlnTWUMqYmVpR5w=;
        b=Tpd/iXlnHx0fPCsVQQ21j3bk0s/SIifzyT1QO+wWZFOSwqdXtE+8Xza9JozTsSfj/R
         kVwSLrEngLEqXyBYXtYJXgYLWXHZqFjcrXy16YdswxBJEVJ+2bH4GifZKxzMFAym2w++
         StVMH58+tliCscO+uTQhOANL1HBZMPRhqnSZCY8BG1qJitP1hN8o3gCOqisJ+EQDajp5
         e+pd+8DN9Q/L1oi95q8GMRmD+Vr85OGVe9TeQeiQ5r5sBA3AViJ+MW1WdGDzUf5upIRc
         PPi4NVDIY+5PddkjOC5oQktfnZyyEEhQ2QcrkGFCQzLVflbBwKJP3iUHvuCk66mP8SgB
         k33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409449; x=1774014249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7h8jUUtOMLoMOAauH6/3SgpVv/OymlnTWUMqYmVpR5w=;
        b=ZfzMJUQiPx38QPniPjqUU9M70xVwvGuy3JdLF6a5B7ylDZQkGKBMFwpBT67ukT+2nG
         CHPnB39AuOy9iRjWlgMCIlWfeoceeIpfqiVIprEOXBpwn/F1fJsBk6TVMf/1F7HLURYS
         WwpHe7NKLIFcQCEKWYn7v1U7Cgzp7ZCZHq5Q1ytaJ1VqZlw0hA5xhwolYV2yn1nccXEG
         9dh98JRqmDWcPm27kRpx5U+pN5VyQ/zuIyTuSezEH4XdUlMqixZPPLb0RuWiXFo07hbx
         eMTGe2gdKir7A1J5TizC3tVzeni1cHBsygjzEYNbLmzJwYgYJ/2SQ7PRAJj/wtYRIBZY
         YceQ==
X-Forwarded-Encrypted: i=1; AJvYcCUveZadB9NEooN7aGb8K5uFbX5fBLWGo+yTHcfsl3/NZ+JHoUgnyidAsTy0WJ9mVsuUWLFoDcLc1LRgVe5T@vger.kernel.org
X-Gm-Message-State: AOJu0Yys2BpwYA+ZhUv6gZoEP3va7J3g6r0ygxs3jPAQqiC7bZMFV7rQ
	gqGNaYgwv0CZrg0LLcpM4mwUX8zm1t5vJNIovb1PwodC8ORVTH0Du+t25wCE6QnzgPjgGSgMie5
	q8vxrz65KfI9XyC50WIDqHBuxb7Ae8atZhXwBdXeleyrbroOoVcjTaFVwNaYlqT3zUy/j
X-Gm-Gg: ATEYQzw+nmE3VqtvPGusPUjg9jO9QDsCcjmPuoIra69vLUJk+xg+deeyjaL+ULLJLoB
	ia85xEd6JHNbZofVz7AqJQTqKUBlkWsiv34GFff7cBYdvwOs9BaOCV6rbb4TJ4rjZ+2piKUC+ui
	87BY1QcpjdHDrpRvUZTnSP14V3jh7Jti6f/41THD6nss4fxBUcMUFRkkQ0cmtko1+6MfZGsB1yq
	Yq/3g3J1Xuw18nXRTLGXz8j92UqerZWbzWGRtFNbj+FCZVSUam8jnIoreEtzwTVFHG9KkRsPcZG
	YdwGx06yDxNkixcn0fAIdoCNi/UA8r1gPGvhsQiXVpPYXa99E5NksY3bWHJf/2DFHD9macrtmYj
	lYR/MN7tWHCGNYsDk6iztyDzjtog3J2EI3A==
X-Received: by 2002:a05:620a:4629:b0:8c6:a5bb:f464 with SMTP id af79cd13be357-8cdb5ba1b99mr464309285a.66.1773409449511;
        Fri, 13 Mar 2026 06:44:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4629:b0:8c6:a5bb:f464 with SMTP id af79cd13be357-8cdb5ba1b99mr464302985a.66.1773409448831;
        Fri, 13 Mar 2026 06:44:08 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm21273495e9.12.2026.03.13.06.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:44:07 -0700 (PDT)
Date: Fri, 13 Mar 2026 15:44:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Enable keyboard,
 trackpad and touchscreen
Message-ID: <n7y47uwm4lfgitn2j4awj5budgi3l3vjf6vfrsywiilwzr77zj@m4khj2scbrnd>
References: <20260312-glymur-dts-crd-enable-kbd-tp-ts-v2-1-2277bee4c564@oss.qualcomm.com>
 <4ac54faf-e27b-4907-ae8a-d3ec910e8040@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ac54faf-e27b-4907-ae8a-d3ec910e8040@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: A57l2btNd8tYs0XqFab_vynBuffc_5jl
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b414aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=n9Hp0GIUcRTdq3tSPBAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwOSBTYWx0ZWRfX3WX8J/ZHji0i
 m58SnmhLfzhFxy7AczZus+XJFRWNz2WmUg420Kpci597MBROWnlGFpCVwi+dHyvwJJIHBFx3vJY
 m/GBeXrvZlMQUFC1MaPLB1/AMtSNPmzriu1Wn2YaUoquFYmIG0gN8H0yGABbXN4RP/CwDtDEmrc
 7kRYGPs5ZT5NVcHs+UnsxHcnD4Aw+kLrL4eTyOousNqqDegPSjgwaWIggixo+zXDVgR2YpHfcr3
 vn0sbB6uI0gxK3zd3sqMbjcGjrgOC7OITAuQTBZfwHtDV9yowbj4RNJiYbadoIm+9otECe35H7+
 Q6KfM8KU24vOiGS1SqY+qj8FnR2hSmV0SdrhAuDLPtdrDyoar4yGBgIdqzDDkIKgQabX543+cYj
 Crcsy0tmVsX0S0fQpNfHKlUPBDFZWx0+iWWVJt6/idszMTBdoNNV4vD4nNh1G5QtTAAHf/YF3oU
 iTIWQ9liXv0I6SLmNGQ==
X-Proofpoint-GUID: A57l2btNd8tYs0XqFab_vynBuffc_5jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130109
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97520-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 453A1284594
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-13 13:57:56, Konrad Dybcio wrote:
> On 3/12/26 2:00 PM, Abel Vesa wrote:
> > On CRD, the keyboard, trackpad and touchscreen are connected over I2C
> > and all share a 3.3V regulator.
> > 
> > So describe the regulator and each input device along with their
> > pinctrl states.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> > +
> > +	ts0_default: ts0-default-state {
> > +		int-n-pins {
> > +			pins = "gpio51";
> > +			function = "gpio";
> > +			bias-disable;
> > +		};
> > +
> > +		reset-n-pins {
> > +			pins = "gpio48";
> > +			function = "gpio";
> > +			output-high;
> 
> we shouldn't need to drive this pin by default (also missing bias setting)

Good catch.

Will fix.

> 
> other than that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks.

