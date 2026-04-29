Return-Path: <linux-arm-msm+bounces-105159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKlSFrLO8WlrkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:26:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7045491D82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA1AD303F2B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4FB3B9DA1;
	Wed, 29 Apr 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMao1LGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeO0vdxi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021C03BC664
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454487; cv=none; b=nA1Jg5q53nP7C4/ekpf/RZ22DXIiIBvmh4a1NeK3URkUnQARp6dp756ZFWsi3pevLTqnN9ogkFGXKuvYlXWadOeY+T/Km/u69vY2AZ0dPJX1Oki6LmmRkwreSBPlg4Ta1YZk769zRVnk6eBi5yy0UuHYm3vBNryretTXpLb0wyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454487; c=relaxed/simple;
	bh=UD2OhGRoOiRQuRu8hyYHXs+pUDM3OGDO2qM5ioTS5r8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXlpI3ZDzp0sJWOPr7O0DSoamC4YU6AjIHI7QI7snBrYI/BKJl2VSPloFi440Id0dDkewKl6i2TE4rjuqqaw6J5OPIeIWeU4R/SPNKGb3ovH/az/VJZk3PnNe3fkpRF+NsM+k/l0hG0TkyL40JsssO7iElpJeNUnDMjrlOoVnRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eMao1LGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeO0vdxi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ppXJ2094109
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+VxMDfovcPTHc1i48TzmhGmrYWTJq7vT35UvWMuOzM=; b=eMao1LGAfGVaxmB5
	X9pwAUr5On72I3xyLO+PlNjo+tPH9GDaxkifxY/6ZQNyNTqeQ/gf8PdF3aF+Q95V
	Fe0DB4B8B5wwHcMIBJttov5QHsq8naxUPaWM7tlLcnhrim7kNZKF2oTvIPvwAngr
	RZwzgPpuRe3p57smW9bfS7YlJUscIulxXNRqkXONl1WH6ZriTigbE3KtgRvXCivW
	GtYcEOFfw7HeZ9ocyy3ST/2CKa7xNDLS5RTdAeNPx+OMAK6RmSExXYw2EPt/9s2R
	t0GHEkPhl6MWloE4bF+7e3aXHJ5nCKCtXR2lL0w6GmarIFzE9SLYz3Cx9Y7PCJLY
	2MiPKg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3rjjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:21:25 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f777e3856so1001451e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454484; x=1778059284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+VxMDfovcPTHc1i48TzmhGmrYWTJq7vT35UvWMuOzM=;
        b=aeO0vdxigr/A5pzPrMBIvejYeCunIrQReYnfDlrTTH0nYnmPQB+8EobQbjKYKgX54L
         +rTqsy9PSUmFLHq4xfJIJ60QCSPkSrhzcAYYffjLolGtzrpbsl0y9Zh961PQQ7KEfDhe
         yYehtxxxj71l7jJK2vyL0EDAFzPXgaJEg4mD/rrHGXq2wyjdlavqQZ3GKAFz8oNbfFEU
         R6bjleQwLIKWWcHJwrcX5fT96ZGAZxfZ0Xd7gr6VseWNxV1zbjbXZpAg4iFdS5Xoyt47
         TYbu5j2RztFB0VR5ctRd01nTczZ+YSDAMHfVWIeEyQfFrEDdvPUOTx8pfx+3XcIM6vcS
         qKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454484; x=1778059284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+VxMDfovcPTHc1i48TzmhGmrYWTJq7vT35UvWMuOzM=;
        b=Be38hnBIkim0PiEiPz8i8pwhJLSFT4tRdSwiEonqM8MIPtE/0rls/jiMF3lOtHiFRa
         3g1o1kqzCCQhpBmfKpZMyGB1eWoF/NsRN85dvl9Idr2Yit5O8/gqcqbGeNFCLqloyi7G
         4OgUK2D486J5DgONmSvq1pkMjl2b7mIb8zllwM+TAMU9nj1aX7l4NPlN5BAi5VpkR5Lm
         JwK8zgTwoykOVuM0WUR9qrfzUhuoQtPuMe3D2JCqJDu0StVpwCdCiJCYd7WjP2c+U2Cj
         uCOTrPdwtZfn3RMrOMlSYMIJqq+F5vU2f4stqqAU01VmG+0fGmMxlQWAtxqsdrUBDo0b
         N5Bg==
X-Gm-Message-State: AOJu0YxaplBY1zr+7zPK6cXJitc2lYJbnrAe/PLFpSCI456YqLGl7mKq
	Ib/H7jbdQTI+YxMduM9Cg2GM1PPK9dCuG07dosqXNOqh7oyxBS1VEu2teqQuMfqeJRQQesqZH5T
	0iuahyJ4PiLn4WaIf4Ax/vbnclzyU4c5Si+dbp9NO96gt2tCQBBi6/FVkTbUGwdNAwP5a
X-Gm-Gg: AeBDiesQlQslxzkAfvtLt/c5MtNlgfnUS5sW/6YQHOBaM9CIK2hzCI7PuI8XJzIW0Ip
	WiE3mdfPrliXk1Vm8mi7f9iSsJrBg6U+hqCDJcrGKbZpVn3h/mrLCHKnASqVm3qWnUfgE/BQAvz
	8yPcDW1qFerdO1K3OWZ6srZaQtDOeK1S9FsSBIS+SS1/uTWU5hl4gU67sCap8r2nDj/4Ih50DaQ
	QKeV07pTZ97BELFEtuPPCZt7O8JnvkFJRnfX/u4wYD0YaFzMKeKAXSMa+ahPmhzr9bW71sttVpq
	eVK1JFCHobAio2ocCKTWTTQE8NA7TATetj8qK4iSM/ue5/+RV0SxxaFrFSCUjr0OiAGWkFiUdbG
	AWMI6Yba3GbwEL4D1MXZw5pVy2/kihq5MVVOBKFJ70BIpJAu526RMabNEnXfqt5iPeFtO8gUHcH
	lXYaAAYxCg3K3SOw==
X-Received: by 2002:a05:6122:2a50:b0:567:4293:8d38 with SMTP id 71dfb90a1353d-573a294c552mr1851427e0c.0.1777454484407;
        Wed, 29 Apr 2026 02:21:24 -0700 (PDT)
X-Received: by 2002:a05:6122:2a50:b0:567:4293:8d38 with SMTP id 71dfb90a1353d-573a294c552mr1851417e0c.0.1777454484002;
        Wed, 29 Apr 2026 02:21:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98543bf48sm65502366b.41.2026.04.29.02.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:21:23 -0700 (PDT)
Message-ID: <d4962403-4e54-466e-baaa-6bbe28707c5f@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:21:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] interconnect: qcom: Restrict drivers per ARM/ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-2-e6bc3f7832db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-interconnect-qcom-clean-arm64-v1-2-e6bc3f7832db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 75A_DAcuS4ymeNjUVuGcJNgrV9Ey0vJ-
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1cd95 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pmW9M_d3okJ3YB8kds8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 75A_DAcuS4ymeNjUVuGcJNgrV9Ey0vJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MyBTYWx0ZWRfX4FQafK9YVDZP
 fGGYAij5wtZ6U8g852SnmD++VawFLouKRPGsvbJdyIAHEqrzY/ovNCZ3Ty7FBUwRcIoMEWfevSF
 1YhF8/G947nl3sGZayVi57HVIEfiPljVD/HUiUBFMHWKg5bMVEez6IkrPC/7p5/XxZnrgSf8QeY
 SFf4QCB71yKGWm+6VYx15tNG/afEFMrJMkMLvZJDn3odnsHX9AifBgoWhBUd/OBpPx7TCGpwAdT
 n3PyAZveeeQLrbEF6cUmWDygvbx+RDjnNrP8E4zbISQc6vOA+OH7DU5S/fH4VKz33hKLXZc+O4o
 SQY6b+V1NmmzL3D5TkZbodzjMVRL+8y3vazBp/TXWUJKCyAeqCrfX+iDpTGIxcpY00F7jLyJ6Uq
 /P6vSgHoGBEkS0ocCEHp1AJJmhzzYIPS/S4xtdQZisrGAm+Zq4duji7SNB0Di7WrLExHoWssKu+
 xEs1ssJSAjpPxj1WH/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290093
X-Rspamd-Queue-Id: A7045491D82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105159-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
> There is no point to allow selecting core SoC drivers like interconnects
> for Qualcomm ARMv7 SoCs when building ARM64 kernel, and vice versa.
> 
> This makes kernel configuration more difficult as many do not remember
> the Qualcomm SoCs model names/numbers and their properties like
> architecture.  No features should be lost because:
> 1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
> 2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

