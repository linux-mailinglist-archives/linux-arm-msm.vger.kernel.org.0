Return-Path: <linux-arm-msm+bounces-91105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M96MNLtemnT/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:19:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C9CABE3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4640E3015461
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 05:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26AD2DA75B;
	Thu, 29 Jan 2026 05:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIsQLo/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdMh0+Hl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC0DC8EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769663945; cv=none; b=uybwcDgFb/cRxFoNXiYwIMV9TmeI3GGNTtunDJXYYC8nypXQrJ6WAaJvLcRSZPIFiagI2eoRguy82+eaL7+FMG+XHm4OTVBm4Y6IFRHATKqnUlh5/mu0Mj3D7ZYWrUbas7ibA12MP3p4j7CQ4TCN18dAREzsbVc5Cs0dkVwmknM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769663945; c=relaxed/simple;
	bh=+wqwjINESFb+Agte0+Hyfp0VgNq/jnNkSiiD6RO7Voc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rn/HsvWpCyJ2W+hib9Ox3i8iE+/iZ9Ri3HdDmNG62EGxU4Ay+JFNnKXyK+QzJcjYa1vk96DGYbGtKBMqYqqn71w9dsPbAab8w0qjS9Iw9wTZ3WHB/D9hRDdzmhmg5pcjjWqCwlIZ6YttmFao8MR48AHsaYKWMYPh0jAsz558VY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIsQLo/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdMh0+Hl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2p4M62374634
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=71JtxlFDHPOmosN8tqAs5VkE
	HD5RaApQbu8ltvDWfQ4=; b=hIsQLo/7viWBGsehfP2MhkRUoFn+nx8Ci51/Rguu
	XQE2w9uh7XS3S9XFz8Ohr4SHCAw2KIwaah7q4Vd0pDXiKDpU7sP1iQUoUg7hRboS
	9AI3D+fXp8kYcOp3QHoYtW5JejYzJEAoFI2cEcM1DlfFFAAp7N86cZRemWuQMSoq
	1CvsMF35UCoq54IS0z7ma9IynYmYkHg1YOQuGC2v+vh31W5UGtYXgz/SlN8WkOSm
	9TJPtrYg12/GKtlaGrJv95SOckvxerNcG/nGBhwDSxDhZbwYTiFNQsEEjF3RGU7e
	QCKepc5JFGPdCtAu/JOz07g6nzSYbbcD+sQlARoeDLqsdw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypk21yb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:18:56 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a5098029so3080925c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 21:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769663935; x=1770268735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=71JtxlFDHPOmosN8tqAs5VkEHD5RaApQbu8ltvDWfQ4=;
        b=bdMh0+HloVx9QpoOk6iqVt1B10SORq5PLwNMtU2W04nUKayD8j51UareRgwfO6nUnK
         znBmOfrAdCoVp+gD7AIQ8TIdgfKFeYGIuyz8OcQ4hjr2iIq3dB8MokknwDWycJQuQvqp
         RwY3h7TmqAHHeVzhgqZsFF9/KUYqOByfKSUJX3EU8Uqv7KMvqMRCGcgnFbB1PwnfB/fd
         xaFC8Umvz/N5RhCz0e0c8yr/BqNaFOpaxo/DdPhsRikZTQjDauP+UGkldIcxpjrbQ9MC
         VFs0K+1Gq9+3Xo+EFzIUndYj1DsAz3C6daOu3jEwojN+s354IwjaWBVXGFW1vrUD0+ub
         2/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769663935; x=1770268735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71JtxlFDHPOmosN8tqAs5VkEHD5RaApQbu8ltvDWfQ4=;
        b=Yqa+BOxC+8Inv/Ne+iQB0DW/6p6zRdlIrjZqOeyw2XFGzy5pv2qCWFMwp+EKWdXsZA
         3FgoBUuw8eHR9ayboJf6zKuIi5J/nXlGm3egoSGSQvrmdsQHbbhIjkD1m4Sq57Ju+tOM
         xpZMS+0gXTrPsTWUz5DXwp+KPHh8xXlxeEXXgUAmsHirzHfNPlK3xyFKPEScQbKgymtP
         pat2G32FK3Ai+98Pye7RLXmYbC+914RhOty9F8Y/YWuw9y4An9LeUucSiRKQREGVlIrk
         n1fs+2YOcIuGAVZ/ukg64hRH5fIxOJtNscA/Kqx+TqHWOqAwart2C4xGBudNm3tPpWJE
         2+ew==
X-Forwarded-Encrypted: i=1; AJvYcCVnDxKayqNTTsEb+Y+WNTR3KAmRcDvCbDhFHFT5r/lQ3Gr36ddDCRg3blQNVkQYGBYKI0Z6DyypE5K8w9zY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3jQjdnM1RQwc6v46gkUbD9JOGEcDSlBlKS/yHzCdMby2uhaoU
	l+2OamwA38nK8J7dFVmUVwRQDRHBtewMfm5bLiHpjXuK4gGAoLqYZfpOUnau6/gp+h1TmiV41/o
	pQBgTzkpvsAWg06/NLJ+WJBVF5wYd0hKgWMRR/4S8wOtxrkVpXNhxChufIkNnt6QOxbm2
X-Gm-Gg: AZuq6aKKqq3J+mPaL3ppr28i5+ECcZme5j1rMFNcDODstOPLRZJ7Wj10hqELC9PpCex
	3Y41F7i2xgbU/PP/5CzT5BRLK5T1B6d0WQIDyzDgN4HKDCzHt6RDzA7Jo35UvedpSmBKIMOgFzB
	Fosb3T7R1iHiWe5vrDorba/wLeFIGH6UP94PImv/QneDE6kE0PsrGVN4t4bq9vj+LeunFXca8wT
	1wZSBIaiU4kgru9loo1FEySpXUysMomQjOv7p+Y54Yb1ppVWAqYdIMjKd5McFehlJmjfWQe2bKq
	3F1kHGWUNSuzYeFnYwUTODmB2j4QkjDAvochxb6JbUPwyqSG80rngcX/0wgV6j2K/F46scqyjfv
	AEk4gAI54lYOIauK8kxZWoSEx7TFtv6RaJXMgriV3Xt++5To/BuFx60lX
X-Received: by 2002:a05:7022:6083:b0:123:31dc:e8b5 with SMTP id a92af1059eb24-1249ffde54amr4480026c88.0.1769663935231;
        Wed, 28 Jan 2026 21:18:55 -0800 (PST)
X-Received: by 2002:a05:7022:6083:b0:123:31dc:e8b5 with SMTP id a92af1059eb24-1249ffde54amr4479998c88.0.1769663934542;
        Wed, 28 Jan 2026 21:18:54 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124abb2c514sm4240540c88.12.2026.01.28.21.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 21:18:54 -0800 (PST)
Date: Wed, 28 Jan 2026 21:18:52 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v6 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Message-ID: <aXrtvMK7ZLj44ggn@hu-qianyu-lv.qualcomm.com>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <75lzykd37zdvrks5i2bb4zb2yzjtm25kv3hegmikndkbr772mz@w2ykff3ny45u>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75lzykd37zdvrks5i2bb4zb2yzjtm25kv3hegmikndkbr772mz@w2ykff3ny45u>
X-Authority-Analysis: v=2.4 cv=PfvyRyhd c=1 sm=1 tr=0 ts=697aedc0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=gEfo2CItAAAA:8 a=f8Cf7bV1bybJpCVOFBUA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=fsdK_YakeE02zTmptMdW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 1AmvscWmO33jKbGp9_orSHEsmUB_WNSf
X-Proofpoint-ORIG-GUID: 1AmvscWmO33jKbGp9_orSHEsmUB_WNSf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzMiBTYWx0ZWRfX6pfuBbKusWGH
 iSFA0+TAIEVs58pCeqrr0FmoEbDQe1s2SPM2K8dGiL0J0aOSKzC6yEbH/tadoYrmu6OGBjMON4V
 c+fflSB1DYCICMxSsx2G5CAtBBiIgb1ib1sbLA0JuFLV+Gat8DPLOtqu3NubFktjYI5sjdCCMUA
 el+lKA56YylFhayVVTSTz6W8UD9kx/M8cxkqv0dVpLcLWsrzpHBQ4a1nYweILwgn6+KgcLu6PK9
 FPgruaIlk0eqUQSHvdcpqEoFzWHoAlAeb/mY49BjM3tIpLvwCwpa6ab8bl6+b9csVCEYvB42aqm
 5iRpDCyf3z44zsw+FabQ6YIksvz0VHb84MIgSUJI5L79yzZ12IZH+bXdUTitI+b9Kxa34LcfqrP
 urL0WABSGjW3JVHCoIhXITPyopfGXZLrN4SA9uDXTs4/PFvB49EiyOJ5dnMsWq63V6sta4C5N8/
 NC6r2ooVbaULUjMru8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290032
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91105-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,c400000:email,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,b00000:email,ee00:email,hu-qianyu-lv.qualcomm.com:mid,c426000:email,a00000:email,qualcomm.com:url,qualcomm.com:dkim,oss.qualcomm.com:dkim,codelinaro.org:url,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.12.53.0:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27C9CABE3A
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 07:21:04PM -0600, Bjorn Andersson wrote:
> On Thu, Jan 22, 2026 at 08:53:57PM +0530, Pankaj Patil wrote:
> > Introduce dt-bindings and initial device tree support for Glymur,
> > Qualcomm's next-generation compute SoC and it's associated
> > Compute Reference Device (CRD) platform.
> > 
> > https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
> > https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
> > 
> > The base support enables booting to shell with rootfs on NVMe,
> > demonstrating functionality for PCIe and NVMe subsystems.
> > DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
> > TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
> > thermal management. The platform is capable of booting kernel at EL2
> > with kvm-unit tests performed on it for sanity.
> > 
> > Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
> > SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.
> > 
> > For CPU compatible naming, there is one discussion which is not specific
> > to Glymur, Kaanapali and Glymur use the same Oryon cores.
> > https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
> > We've kept the "qcom,oryon" compatible
> > 
> > Features enabled in this patchset:
> > 1. NVMe storage support
> > 2. PCIe controller and PCIe PHY
> > 3. RPMH Regulators
> > 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
> > 5. Interrupt controller
> > 6. TLMM (Top-Level Mode Multiplexer)
> > 7. QUP Block
> > 8. Reserved memory regions
> > 9. PMIC support with regulators
> > 10. CPU Power Domains
> > 11. TSENS (Thermal Sensors)
> > 12. DCVS: CPU DCVS with scmi perf protocol
> > 
> > Dependencies:
> > 
> > dt-bindings:
> > 1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
> > 2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
> > 3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
> > 4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/
> > 
> > Linux-next based tree with Glymur patches is available at:
> > https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/v6_glymur_introduction
> > 
> 
> FWIW, I applied these patches onto next-20260128 to see if things has
> improved since Rob's report and I get:
> 
> $ make qcom/glymur-crd.dtb CHECK_DTBS=1
>   DTC [C] arch/arm64/boot/dts/qcom/glymur-crd.dtb
> qcom/glymur-crd.dtb: dma-controller@800000 (qcom,glymur-gpi-dma): interrupts: [[0, 588, 4], [0, 589, 4], [0, 590, 4], [0, 591, 4], [0, 592, 4], [0, 593, 4], [0, 594, 4], [0, 595, 4], [0, 596, 4], [0, 597, 4], [0, 598, 4], [0, 599, 4], [2, 129, 4], [2, 130, 4], [2, 131, 4], [2, 132, 4]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> qcom/glymur-crd.dtb: dma-controller@a00000 (qcom,glymur-gpi-dma): interrupts: [[0, 279, 4], [0, 280, 4], [0, 281, 4], [0, 282, 4], [0, 283, 4], [0, 284, 4], [0, 293, 4], [0, 294, 4], [0, 295, 4], [0, 296, 4], [0, 297, 4], [0, 298, 4], [2, 124, 4], [2, 125, 4], [2, 126, 4], [2, 127, 4]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> qcom/glymur-crd.dtb: dma-controller@b00000 (qcom,glymur-gpi-dma): interrupts: [[2, 76, 4], [2, 77, 4], [2, 78, 4], [2, 79, 4], [2, 80, 4], [2, 81, 4], [2, 82, 4], [2, 83, 4], [2, 84, 4], [2, 85, 4], [2, 86, 4], [2, 87, 4], [2, 88, 4], [2, 89, 4], [2, 90, 4], [2, 91, 4]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): led-controller@ee00:compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): pwm:compatible: 'oneOf' conditional failed, one must be fixed:
>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>         'qcom,pm8150l-lpg' was expected
>         'qcom,pm8916-pwm' was expected
>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> qcom/glymur-crd.dtb: led-controller@ee00 (qcom,pmh0101-flash-led): compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>         from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/led-controller@ee00: failed to match any schema with compatible: ['qcom,pmh0101-flash-led', 'qcom,spmi-flash-led']
> qcom/glymur-crd.dtb: pwm (qcom,pmh0101-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>         'qcom,pm8150l-lpg' was expected
>         'qcom,pm8916-pwm' was expected
>         from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/pwm: failed to match any schema with compatible: ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm']
> 
> So, we're still missing a few dependencies.
> 
> 
> Booting the system I get a ton of errors from PCIe in the kernel log:
> 
> debugfs: 'opp:5000000' already exists in 'soc@0-1c00000.pci'
> 
> # dmesg | grep -E 'debugfs: .+ already exists' |wc -l
> 508

Hi Bjorn,

I tested this patch series on my Glymur setup and I also see this opp
debugfs warning. I checked other platforms and found this warning has been
there on sm8450 and sm8550.

I checked git history and identified the warning is intrduced by this
patch series:
https://lore.kernel.org/linux-arm-msm/20251013-opp_pcie-v5-0-eb64db2b4bd3@oss.qualcomm.com/

But I don't see so many warnings on my setup. As per talked offline,
these many warnings are because the probe gets deferred many times on your
setup.

I will work with PCIe maintainers to see how to fix the warnings. At same
time, let's figure out why there are so many probe defers on your setup.

Could you please share me your bootup logs?

- Qiang Yu
> 
> The system does eventually boot, and I was happy to see that we do end
> up finding the PCIe devices after all.
> 
> Regards,
> Bjorn

