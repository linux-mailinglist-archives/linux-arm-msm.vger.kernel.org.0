Return-Path: <linux-arm-msm+bounces-103594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JaHAOOf42kvJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:14:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8734216D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C236430055AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 15:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F54D2D5937;
	Sat, 18 Apr 2026 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfu/CNcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLbNhG+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31BC2C158E
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776525278; cv=none; b=cArDyKB1srXLsqFhP5qQY7g+eycsDvpI4wMZdtbBvtbwzXnet6ZGQAQ77e0YYl6Jfw5PmNHOOeQJLxasgG/bGMnOP8w9llWGvDTTQUY+Y2cR5C9NsuchFQ2980cmosMcON0brfjDY3samdhcFMyPfHlZmbpmNVju03GVj8kjYZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776525278; c=relaxed/simple;
	bh=ccKJ5Wlot9t2jmuVxq+3O7dZPG8038XlN9RYAZJSGpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyDy8zQ5NeHvyZCs0dbfzJMrKu8xjfnsb31PDJ5IZCXGXKfh5OjbvD27pZejukp1Iwp7zyW2YykKqNPKe+YuzP87h/yvxzIL+vNDbwlp2OVN0Bw7mHc8d3hkBoIJDw6kFZSvs6C4TtGL6/ibnxeyWUbKNKPzZzRUqsfzIB+GfXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfu/CNcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLbNhG+l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4U9dZ1430546
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sUHaxeF/EoZBdTjX6SV9pvQD
	/6uOcuvrjspwrrjEhLQ=; b=hfu/CNcG8qMSPvXDdLCq7+9ZYylx/XHQsf3t80gZ
	5cqyUDBShto4STCwIgr3zB9dOZ+Yc+qSfnps9NOSdQpnIHaq7Q72ShNe9pCJC8GG
	FFyCkezrxhOgJRO2B4Q+uXD5zG//k3VkRBK8EfBKNBSRtGzPmxL9JWsTIFpCCUBe
	ySzC27Hkx84F5eucX/zEzVJsa7sgGJiagUKkxry6ONvQ8gUA39EvzA7WsEcl0srQ
	3nYnUCLLN7KmykKU7gUzeulwJwuUgBe2yMwETpE2sb3zXvGQD/ih4N5kSa0TPhJl
	Z/xC6eReHnT2LYd05+PcnSNeZ+lN+s67PfBifP6z6xCFZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21ugytj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:14:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50df4c130dbso3731331cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776525274; x=1777130074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUHaxeF/EoZBdTjX6SV9pvQD/6uOcuvrjspwrrjEhLQ=;
        b=WLbNhG+lrl/AzVQBA8/PkoYceHJjDrxK8TzOxfYpondolXvOrV39DHcShcYcdO+IS5
         GZEi4TEkZAsBIm3JmkHuq0Ho77gzcukKMLl/MW3+xKu8uY9YUeouND9wGlD8CZ0OX1Ga
         /nAtqF6FjN0kDlHjrBD6benCNmEHf6/D7u8RS3+zVYpXKbKBxoBvstqYhzIVF6NoLD/h
         TTLpTD0ZW/X0xsgU72ru/qoGjIgX2pzdjywNp7W0IWp8zNpsR497sAlZoIHJgAPpMX8S
         X9cX9oxWLPwPfCF9WBgpi5I+JN8rV0WCsFmSn/ujP5mytHk2PPWdQoOszpjBx9jaMMpq
         VTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776525274; x=1777130074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUHaxeF/EoZBdTjX6SV9pvQD/6uOcuvrjspwrrjEhLQ=;
        b=Qv6PkZXL4YW7+xm4xjVH3CDpw2wM69eFtzEg37XB/YoGA+eZerQ99eDv1I7C8S30Q6
         JCPlqfyJA39H/8Uj/zhPYcoCElmaOPcPrdnQF/lYegYxS994rJ/L4FMMNzwPgKFkf/Bm
         YZcEkDjKhDI3AATS8LHCPbh7IJw8PV0biH4+B3AOoIUXwBjaxGAOn0PbXhSCce3kH5MU
         R5+gsX8Qd1XnBpnLqnkTGnGCSNrU5RZneNAntjh4TYUUjxeQ/tr+83McdRLpYzn8n0Vj
         c7QHyg81UyP37sYSwwj0tJP7+fcCjccyyJzQk+rP/hTT7H2cvqbjl0dJCAY3I3SZNeHv
         Md1w==
X-Forwarded-Encrypted: i=1; AFNElJ+RN+SmPU4jveoL4ShJJp9ofWlwfmyXLxPnOJN0yL5y09FpK7MxgW62S0FfYvv8sfxtoVCx20RjLKOwA93y@vger.kernel.org
X-Gm-Message-State: AOJu0YxuL2+sbyUUYIj67FVheEo+YVqWTcmiFuH3CZOF4idauPlsckL/
	KMnyzA7Ur7ZXsYuMpxfDh3NzKYAhRSIMS/d5Zhgwv+XNqQX+TNpHeigk1Tg0Lm7scP7FPqf8CNZ
	j/GWOoWs60Xe47n9VkL65+qj98DG7NMeww77qSmz5b9ozA8tPIYLT/yG56ujQNtIHgEDz
X-Gm-Gg: AeBDievpa1HAhTvwAwpyZPrxrLhRqlRXb4St09STgK0NMSKvgRUVv756FjIEsEm94Wp
	cKYZQyhbcomCuR4sNXo+/qq+6PKqii9aG1MkapzeFEUsBkZezN0yWuUyvp+Hzy3x+XNtV76IrUc
	wunwDhMYGsYlB54V8Z9Z7nZx8kFEaZCYGOMBrE8xkP37Hc6Vcm+vg7BbJhFrtNK9bA+/f6OKvmy
	/U9lxbD6TWvSWyU21S5n2596ph0Ddef63S5YN3elue+kzsqM/MaAeKorkiyjc1dO5P85LbtTSBj
	xA5uE0Ns/NqYMyCTmeORb2pZQ1gkTQFzV9QoLmDaG1Mp+TkMQ4okPTarXrRbeTxccXs1gf4OJjT
	cks1YkhxFLmiDMyHWFouA44AlGAr1gz5W1Woh2JKP1i6HXWC7cLk+WWa6FJYpXOlfi42aXtVjPV
	LEnNNg1di5m9EeRDgjSVG6jUNU6uT35BhU8op0tpN3pNz8ZQ==
X-Received: by 2002:ac8:7f55:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-50e3664b47amr91940671cf.12.1776525274152;
        Sat, 18 Apr 2026 08:14:34 -0700 (PDT)
X-Received: by 2002:ac8:7f55:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-50e3664b47amr91940301cf.12.1776525273749;
        Sat, 18 Apr 2026 08:14:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e10f9sm1414116e87.46.2026.04.18.08.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 08:14:31 -0700 (PDT)
Date: Sat, 18 Apr 2026 18:14:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: add audio PD remote heap region
Message-ID: <oqms2nkplvvowefxqw63payl4ti5qffn4koop3ihpniqqk43zv@kkvzw6o3djhb>
References: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE1MSBTYWx0ZWRfX+ThuOv09XhTE
 +ek4K9pz+BX1NOBHb9rmybRBER9oFYqFe6AJxGtn8wU9pKhT+5TM9OFqbweIqH83RlLCoUOF2iy
 nfY+v17RO1RO3ZgqJjeSyxn89FRHOXXzzZJan+v+JQuihLFJkSsEV6G2gIJYvzSx0uMh6NgTh8U
 /iVw/JDiWCjSU5BgzVIsEOlv/BsTN1VhzYcYBKXMSXwXKd4viY5onjgsp4gQokAe95TzxlbTgK5
 cUgmj43OEloxbOhS07KjOTlKZeHglyARMOc4SSFsTi3vXQ6JAFASY8ehuB2daboPjgkKuWaROtv
 nxJ83F1NXn4XGtsAzlN7R/EP4g08Llsg4XKJUpO9ECBsbGXSek8UIMIGghW+LZpPpZmiVMi2NOH
 zbU33nJQyBdGEEx0cQeX6KPyNmxWC9ELbRx5fJgRfl1Ze2dUxVFzTIGco5cW1sLy7tfhaCI7To/
 sWKyHYxvp2stvrUvkPw==
X-Proofpoint-GUID: cqW44OD-RRcCQQwgVcEWkOfZ5cbRYFlF
X-Proofpoint-ORIG-GUID: cqW44OD-RRcCQQwgVcEWkOfZ5cbRYFlF
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e39fda cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=tm-kgbyTeofr2Hl3MgoA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180151
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103594-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B8734216D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 11:38:15AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reference the reserved memory region for audio PD dynamic loading
> and remote heap requirements. Add the required VMID list for memory
> ownership transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

