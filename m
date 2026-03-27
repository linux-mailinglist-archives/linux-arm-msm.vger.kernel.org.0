Return-Path: <linux-arm-msm+bounces-100354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEDzBp+gxmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:22:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7F2346A35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68434305271C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F6C3246F8;
	Fri, 27 Mar 2026 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moFdYnWD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQJsq/2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F21322527
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624756; cv=none; b=kEXn+0AEODqf3mDHMJaUL8xej8Ld3j3qf/EXgd/KJMZWAk5zvMFGe0YVLDyYzfjAtASAjw7AmEV1yAUnqTtBw565PUx39gI2Wae459qeGYn5gKbFIa9E1JCA2e3bwMKG+6LERjW94I8AhA9CVSyaXtLTUaSI2/GcvvMO7F/xVMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624756; c=relaxed/simple;
	bh=ht2Iz5o3NMrdX49tOUVlYi7UocdxS70H8zgzEcKwQ5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2g7zMHjNko2taQhfssExEZ041m3vJjk/8Zr4LAIAX4rwu6/NOxESzlaf5A1I3ZTgVqyFM/ORWktQv0e8cb8rzz2La1K/sQj7czHNw0C6aNb8ITYv8EXNLAFaLjQ80FLg5MgnjBrz8Gzr5yhFuFIptduyz7DJ/8n+osH8l0mTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moFdYnWD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQJsq/2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhHH22769238
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=67Iqn9pPGhPhV30esW0aw8Wx
	qlEOmIiygQoTzBMt6dw=; b=moFdYnWDwnnc+9d6xvPpkxBRqWZYvOcJV1O9e+AA
	pygK4BwqONFjz/lAhhjuUcqwEPSLIUaCZC0ZJZkFHPdmlxIdWMgKMoO/XwL6omvH
	Ay4/MVsYDhy+V40FrbekKm9Eg+BE8rlqE0enyu0EQiTPn45fR6NRIOp0Ttfbn23N
	FYjZL8wrWZf2H8XXeLokccXYJUD/Q4vrgRY5k2GA11/TjfH1Jw1m1NUSyMW2nZqq
	uV8lU1Ed/WIJIqKyOxhoglss6jSkYANrpnKgtDIqSw3VZQGW/0vOdiYrxOwBp6Fh
	UH/Tu6/9yIpy9Hqz/ZPWl7UT1TpLmHSPLgB6Ifxe+PBKCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv3kd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:19:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509070bda13so81967331cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624754; x=1775229554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=67Iqn9pPGhPhV30esW0aw8WxqlEOmIiygQoTzBMt6dw=;
        b=OQJsq/2b3MUygvHK0arEh7ianG1jSaxM76zFKVcW1hA5Roz1Exll6xTtk6u9+bYOmr
         maoyPcm8rob598irl7VRE1+dOCkgLEv5g1YAUbZREwG3DTY98YFKqnrVZmhDnaySGfwB
         wDOEzzqFM4TusSa/Z+bgi5wPeYCkVRiuS/w2S7aZ5i92txOxRiX/sL8JSscAvBdnZbf6
         wbyIy5qMZKtrbGTdPhEMsH0/XdkC7W+tO0rvrkNmW+h/B2ScNCq5xSnIcF5n28SadZ5I
         31zpj1WhIl6PV5VmUvTXWGtQlU9MBjJ8Inz6sEpc8X75jpYz8YoQViRdoz4fk2qANafr
         Z9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624754; x=1775229554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67Iqn9pPGhPhV30esW0aw8WxqlEOmIiygQoTzBMt6dw=;
        b=F7UPPz0IKS4kW+xI1XxoVeiriQhdLwEukGBKrGT/BtRGG9FGoCtVDFIBp732JcZ/84
         QaQ4iCgctg5RUfcE8dJX09RKe1eaURiRoJEXK6OAld9HMjo0pg4OKDyqC5yBBavpOo0e
         4/mSPpk7geYfHDHsUM0QOmvfrE/yAj7K9LAEDmkSKykrY8SWGW4AoW7Ibxgoi1AXKtwc
         qriCOiQxQwcfFNmZWMo7MaGG8x5YX/0DPwSg6NFLLwVNZiu28JX9KuFD4+cEVVwYnWH6
         GJluAStoQYQxTEY0vDbhW4MLMBGYtzUPc6wQiSsRh6V9e0ChHqA9buA40nxf3BIncRUi
         yimA==
X-Forwarded-Encrypted: i=1; AJvYcCXcUCnvyhY7atDaut4+eWFRU4lghdixdSjx0VJ02I6Q2rtjCSPNpH53ABgdrY/ENzGyOgB3t8FVOJGUOj4l@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ZzWqGoqjafQwEgnI3Bd7nwrLAvw8MTUPonhe4VMELiFG/qyu
	ZJk2x7x1vCAGHSJys9Wfbq0mcwWMhBAh60OuiGhl2fErXezdGL+1Byi2r6tJjSVMG823Ke9Jd9e
	mkSAB4YmNQRoLbbKiCVreM3aY837Mm07zgoyfduW9QWcWyuqNOvNobfCYcfmnSTug783B
X-Gm-Gg: ATEYQzyTzFJFfp7Pp4bUihrYkLmm+p3/BRPDat61BmBSy55trbmkgbRdDFyCD6I0Z+8
	S5s8Ed3lZyF30KqS9upMXRERGfksDBdswS8NYrzJHukMa2jzNQ9PXoAf/0IG/S9C4azugDyvx7k
	IB3fVZhNvJBsIMy+goeCyabYr3zrbJyVndnw1Mv4FKPKV3EpDdY22s1plDHLY4zXL0P83kud6dh
	nlmZovjq+4QCYueyYNR0b4MdJUGA9Piri0koXo49B+rR1vblhFcL8+xeO0BulNzBTJATByyJV8i
	vL01JTva+QMzFys5xWRcxRrzJsC/rp2DlWraOqBZ+lDJVENCmkTEmpX8oSvHhZwzxJKSxWDIzIH
	KpsC6FqMOC295fKID9RjXj9UL0lZ4AaKcyQ==
X-Received: by 2002:a05:622a:8d17:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50b994a6c29mr66147701cf.24.1774624753641;
        Fri, 27 Mar 2026 08:19:13 -0700 (PDT)
X-Received: by 2002:a05:622a:8d17:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50b994a6c29mr66147141cf.24.1774624753064;
        Fri, 27 Mar 2026 08:19:13 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be47a4sm155608075e9.0.2026.03.27.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:19:12 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:19:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/11] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Message-ID: <qen34qavxbx4deuyf2wk5n5qujcqbewpbtnqk4rxgbr26nbnvf@gehbmireosxw>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <20260326-x1e-camss-csi2-phy-dtsi-v3-1-1d5a9306116a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-1-1d5a9306116a@linaro.org>
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c69ff2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=enRrE9bUkXY5DYgRGdkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: r_MiNNgj6cw7_s5dqcsCef5RBIWRDAbl
X-Proofpoint-GUID: r_MiNNgj6cw7_s5dqcsCef5RBIWRDAbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNSBTYWx0ZWRfX64xT9zfFcDSD
 BR9DRWviq9wL6yNwKxRn/WCD5oDXteoOF0wJmsgWrvq8G55SEujhzMS0GKLaYNiSgy5cmVPWISH
 5NGMgQXsT9MPZEhvLXQ1Pxc90c7SYHhp+ghRsW33B0txB4eiFmL+2qMmgle4ZIkm+SLpACFoaaw
 bmR9Xx55jDwWCoJvxDRR6KRgopAkvEXMdMsP1bm6XltUA+HAJxNGOFm4zCR8em57l7Bhlb3YdgQ
 l/0WrGCgoxFewhm84K7ZHHQecy+AON/irtHpR7Qtj16h0TYhsCgahVsRODU9xQMO5dnGuiA2932
 HzhsNL8aWHsRrKEo+v9lq9DxmqJ5ZfyQLyK+mPczyQN0HcoeFuJGw45H6g9qkUTE5HQPvZZK4OA
 G7UFL4R/lx2zn1rEWmfWfzSGGzpM0AviFXY2hInMro8Ixtd3H7ZpMr+QKle27uyxe1BCa8OznsI
 PevbyWjcs4tg7xGtUSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270105
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100354-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C7F2346A35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-26 10:27:38, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.

Nit: maybe we should be using Hamoa instead of x1e80100 ...

> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

