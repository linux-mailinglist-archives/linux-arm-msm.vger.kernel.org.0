Return-Path: <linux-arm-msm+bounces-102841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oId5J6no2mky7AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:34:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6AF3E22A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BF0E301E9BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DEE26AA93;
	Sun, 12 Apr 2026 00:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eq4MWcO0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJsfds7I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8841F5858
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954083; cv=none; b=JuZJwkgJ9VPUJd0JG6RwXRr2qn6H7ddn3YrAojYiwLHC8jbrmdrpddN4O0ulzoXr3oQg9o9cpFYBd15Pohwa9vFP/PkgBiRTizYnUHazCSv4yCtJL9lZN6btJTqAfqYt85W7anuBLq1ZiM4uZNGbpa6wBUc9gWPnR6YIjXdPzWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954083; c=relaxed/simple;
	bh=8UmOP6ium5LqD8GBmr1xnWjVDdtN/ujI87UoSG3macY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jI/ssEfTsZaWg5PJw92/R91pVp1MedVdhrIuhnd97AP4P4afsBar+CyldOjoyn08ETq5IlPSw87LkvBVnlbZlEqO8U+pQC7PON4CpOYVmfc3RBX2K8TMRYQqH9b7IpMcHW3O1uz4ZzCmyFZspV5DuOgtAsHvHnwoqzoC23EDLlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eq4MWcO0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJsfds7I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BMukqB958860
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SVhnyDMjwHr0n052rO7zFDjE
	11BoIx6fN45sSKbMcwU=; b=eq4MWcO0Zij4zS/w3ydf4BwdN9GMEELjbuyan2D9
	d8lZ6dmSTiqsDdh4M/qMPC6+rA9SRBQyMCGlv42UrbDQSHHvRfo/scVy7NKfEVWY
	cM3AyxtdIbSTq3Dck8zhgWbT33+ZZGYtDXl7wIdhzsRe4yCdDZFniIlHDQCq+2b/
	EyYvNpdwp40e6V5XI8aPwl43GKAjbZngEr4Nz067EK5eRQqRjuuCpCRDE+72zxhE
	X1OVZ7CB8Ch1kn9aGReqgVs2VvLy4oY1+PyQOkKkNIvHuY13SpcIH2bOxBQyD0g/
	102m0uX61dPl5IinkdK/T/Mvd3yeKtv9VThObejJff1gZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbp98md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:34:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b6f869676so61318211cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775954080; x=1776558880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SVhnyDMjwHr0n052rO7zFDjE11BoIx6fN45sSKbMcwU=;
        b=CJsfds7Ix5TkyW+SsHbd/EhMmIEDYIivmhqwsQzlPkyJ2EGhTJeB19tCGaeQBz/yEx
         GVJ2WuTPKfJlwHNK2yvJfWKyhNF8Go7w8h1CMpsBMV9su1/qxpXUoHjCIOO7Axysh+A1
         amD8Czkhu7TckVU0fICtlCtUf/m6G78t32lLDlnbvhT3XARzCrb+fOcqwegVo1Jj0yr/
         YEJRKU/UqU46V0sCZ6pG1Dh1EWTpC7JOwCOwcLV4hUuRovCtU69wAibybizSOri2dxX8
         mnyLB34ylZsd6M0a16pvCTTO4iK+KJy850YBlY1Vlybk0xxVZy5fov3V7W2cf8JZMeoI
         tavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775954080; x=1776558880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVhnyDMjwHr0n052rO7zFDjE11BoIx6fN45sSKbMcwU=;
        b=FNqYE1GV3+86dBIapRBFv9veG+J6BFFOqOl3PKG3AwZ1xuCJcxZFOQx5h9YZz2Qx+n
         Q4tUBAU72lV3QsB5iRMhIc8KBr5F6YPqzQ9jYZ7K5W9JeyBj5ZBE8LPNZn8zX8JVUwss
         gT9slRqxQNqQep+ETSPxcg4Rrsv0tywpjK0IAlNJbDI9pE3b1ZdeQ9le697yKtXCVmbb
         +tMp86E6sGPRWehoE3F8XAkxbnGb5ihGsHVqDoyJK0l5bRgxJJs7SgRJ38patVQjmSwJ
         1Db5dmm6HHAgejyZI7hooav92nVyqS+tbnEjAJLcQnh22RQBNZ6GcgUdptx4SRvhnkhx
         QdfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMJIELag/CRLqu1ZqXOtby/PtHjniL98sUdvSPjnMbVCNfcAYefUA51DqLQcGFsLaJj4SH7dP7QfSZlLTF@vger.kernel.org
X-Gm-Message-State: AOJu0YyjNFqcZrFqjxh2EEQkb6q/K7SztUtMAoxO1XQ8eMruZ+hA2Fef
	pINfWWInikoWnkR7Mm++90V1aoAEwW2TjYpiyTfJvCgcw+cjvFEcuf4AwELK2kz0jO6zYU4XPfy
	eKijGGBvIvY6BFajVp2UgVv+5N6KExQwfXSAwWx38zAOLXzXTXO1GnDCxp7KLG9n2Z3w/
X-Gm-Gg: AeBDietWl8cvLDcbLpqzJ5j2DDMpsyZJ4mDls2J/AFjYZS3dwPW/XTwvtxusXOObJ+S
	4F1pKoebkB16MCR9D1NIJwBzajtSG9A46Lk/fvRsY1Atpkagwgkwew1TRLVYEkgiuox/e76knjJ
	RX/ELfTDmxJydYegAUG4sxxPBRfleVEZ1edVmLDlbRkxU4s7TSEkDQs9mbXVzoORO+4zXSujbfo
	U1sY+Kk3J+7idkstpb/trStXMfEYkRHolTNezRT3P89blYOCZb0pT/vPd1196a7S6lW4yGxP4b0
	lbCbkzBeDCT0moiPoC9IDBIb948nxMJ8vhv7GuV/CGA4hAPVRTdHtet93tbpeMFq0AkhZ4aFi66
	Pg/AgidomjYSJC9FvXfz3G9l+IjGQNtGhq2zAjRX5J1jGsf47Xh1CUd7KYZKEWo9ykjmNetMC4W
	6YRYoUvWT29jPaki1ZFMc8aEuU8/G6K6Tb2pE=
X-Received: by 2002:ac8:5ac8:0:b0:509:120d:4311 with SMTP id d75a77b69052e-50dd5c02761mr126828241cf.60.1775954079562;
        Sat, 11 Apr 2026 17:34:39 -0700 (PDT)
X-Received: by 2002:ac8:5ac8:0:b0:509:120d:4311 with SMTP id d75a77b69052e-50dd5c02761mr126827901cf.60.1775954078972;
        Sat, 11 Apr 2026 17:34:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef0b4c6sm1705912e87.84.2026.04.11.17.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:34:37 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:34:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 00/39] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <bmkdeyquoyvcwcgucijcxmgnip32fs4gyqe6gvponokwiu55cf@7ncsbggx23ar>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dae8a0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=Eq5kGMd5Xxsw3PZyeDsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: R32bGUdlQ__AZ3LX1y_qnNcLbQzmrkGD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMyBTYWx0ZWRfXxlLW/tLoOaIi
 y2a5et43iqzbb9cZKaZewfLWs0AcQ4IMG6EkJBP7w+wTrE9hrq1DWpoAKhOTxIMYnfplOehQBh4
 pMM+4xOtyzE/cYVGNh48v59BHaQn0vJizw4eLh9iskf/vEdhiCxAHK1hO25MQl+ERBs8GQlmTom
 7f1un2SwmzPsNBKja51pCd6ZgRAG8Nk9Gq6Gacl8PjFibYD8ER8W+JVrfhBbsPsSHNsZN+p5W8N
 jugtX50qxURjHatKpHPUlOZqxDmffLBKtFAhWLV2CTKoiNpEmDCu0GnHJVc2teMhIV6Gc8HESWg
 S0Q1NT0Ndzc6N3Sl87Rmzb0sfgRZRN9Vh94+u8oUVv8qPDuudnmKA+0mbLXX84pG2F24ULHy9QP
 z3RWvkGoopqrzcHJ48Ws9hcIR3gw7XSVJ9n8lniDfY8K+FZ31P8XtdDQEHHaX2rmo3tzu8xFVfd
 biKxo/qc0/4c3oozwAg==
X-Proofpoint-GUID: R32bGUdlQ__AZ3LX1y_qnNcLbQzmrkGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120003
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102841-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A6AF3E22A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:35PM +0800, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams.
> 
> This series has been validated on sa8775p ride platform using multiple
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> 
> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.
> 
> In addition, SST was re-validated with all these changes to ensure there
> were no regressions.
> 
> This patch series was made on top of:
> 
> [1] : https://patchwork.freedesktop.org/series/151522/ (v5 to fix up HPD)
> 
> Overall, the patch series has been organized in the following way:
> 
> 1) First set are a couple of fixes made while debugging MST but applicable
> to SST as well so go ahead of everything else
> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> of the work as current DP driver design had to be adjusted to make this happen.
> 3) Finally, new files to handle MST related operations

General suggestion. Please reorg the series into the more logical
chunks. If you are touching enable / disable path, then continue doing
that until its done (more or less). I'd really like to be able to merge
at least a part of the series in the next cycle, but there needs to be a
logical "halfway done" moment. Let's define it at the "all paths are
refactored, all booleans are in place, we are ready to get MST parts".

I've not found a use for separate bridges in the MST path. Please split
the functionality between the MST connector and, maybe, another private
object for generic state (like connector -> encoder mapping). Other
drivers don't have this issue because they have fixed CRTC -> encoder
mapping. MSM doesn't so we need a separate way to store that. It's sad
that we can't subclass MST topology manager (or its state). Maybe it
would be worth changing that and letting our topology manager handle the
assignment in it.

Also, I found a set of warnings while trying to build the code. Please
make sure that there are no warnings.

> Note:
> Validation for this series has so far been done on the latest linux-next
> on LeMans, covering both FB console and Weston.

It wasn't. I couldn't apply it to the latest linux-next. There were
fuzz-based rejections because of one of the patches merged some time
ago.

> 
> Broader validation, including additional Type-C DP use cases, is still
> in progress and may lead to some follow-up adjustments in the next
> revision. I wanted to post the current version first to collect early
> feedback on the overall approach.

It's nice, but please keep in mind that majority of users use Type-C
rather than native DP connectors. In some cases your lack of Type-C
testing affects the design (e.g. for the HPD handling).

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

-- 
With best wishes
Dmitry

