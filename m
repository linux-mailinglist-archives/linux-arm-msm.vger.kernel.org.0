Return-Path: <linux-arm-msm+bounces-107365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKChMa6PBGoVLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:50:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E19015356F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F14E3023A48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90811378811;
	Wed, 13 May 2026 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1nhB8Uy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3iIp3wc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D96E35CB60
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683633; cv=none; b=VKw1WWIte9TyiY7ZzY6HDeVFl16FY7ysCpRYe1d8waQLmoUoXWArW8Ab9tY50md+PL/e45ZYq0vrZ5RY1p3GyvfAgRuShviiiR1nVtRYKTn6hijyVcqi0YzmrG54fydXjMOU5XYpQyqLpGjHcqXseKRnUqFYkfVsr5rbJMnOtmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683633; c=relaxed/simple;
	bh=b4SxusKqNsSqRkvJjcE/Px/ClSp9uT8Kd5NTn0q9g+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmXc4wH+IhPjktYyfHDcSvgtFYJuNn3gl7scc3ZGjwSBx/lT9/s5vnVlxQF0DljJq8ONwv1RI7Y+xCkbHKtFi2aGwMuR5QebKW8PmtVj0l9xWoB0oxnobJKmNwAic7CKP0iL45F6wEYp11p+wxm322Eh9bQdI5FFkhpe59sSGb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1nhB8Uy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3iIp3wc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWBO4978152
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cOGLbWKWUL7zcGN6Zsk4Euad
	YdpgsTi6NXegh7ZSjlM=; b=d1nhB8UyynKY8DjIQJZyH+lI8hVayz05519mL1V/
	XOIylBd/PMfuIoQMwA2yWfFg07iZZ2hXaAGkcX0YjF+obC5WtW/n9T4uWkinR2V9
	oYqvtQZEUtrU6eu3PciSFrH9ueqxAGcj0/db/1PHjrrQdGTg4WUveGDzGRA+FuOt
	+zTa9NhKSDT+G7rTAJukTOhIPwdYAhjW/RMH5oQMgcN0WgBOPuXSyihhgL/8RH1p
	j/KrR9x9SaAtmPVkD/6HlvwSREl6pnCaOKsh9BRrc4Gz7prRr28EPKizp8X3qdKD
	/Pw0AFY9xdgKlw6vUKPXlzB2SfjvBBv88LB+GKgyfmmsaQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9vs9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:47:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-132a99125f8so10926571c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683630; x=1779288430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cOGLbWKWUL7zcGN6Zsk4EuadYdpgsTi6NXegh7ZSjlM=;
        b=O3iIp3wcBxC9JHeRLBSpihbRYXUrJkpXKfyqpJU3k5V+1Nx30dB4RimatmMX8bxiCX
         WVblu8gB9/yjyX1pDvzFO0ZL8hsvBRrLU9W0v72h/qOxJvI1yHbK3Ry/HDqia20ZX8ab
         BRTG5s4AS0N6VaYtfUspZYjkqTEQKzZPzDk5O4bHhEvMBcM51VZiIGDvlmVaGSX9xL0L
         9mZ2D8agKwhebA6UyDKin+QFMps9d58RPcwCN6jNAvo7bI31SPHzHE+2mtwmAu6WBxUK
         22nKh+0dn4GS7TtzourhGyAp0rHW2MwCc6ETPBCh2PErX1Gh1+neP6FXIwq1dKoCJBJr
         BYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683630; x=1779288430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOGLbWKWUL7zcGN6Zsk4EuadYdpgsTi6NXegh7ZSjlM=;
        b=kStgEHwebWUjefcvGfYb+RRSHFLjub98VZeT+SigSTfYuUT6gy4N5netOggYat9u/+
         qgBCGiYTJmILborSK3346DKpjUjQv5M83HaQfLQMxPpvyZr/BoFlkOEB9AJ5eD3HLnBj
         pHKs0c3gNimX591AuN9yuCyTt6g6RE0w0V3tTUI2O1kxZ7feeRYyDyCGrTLEv1CR9P+P
         Tp5oO0JEoqtFOOe1QKLm0HqGPNZPMDB+dsS+8u01sXM2xymh4ffyz5sih7Js364ENFrL
         P+vyIebIT3F1p23eYRVHS7CEvskpn+yCdhtBcfZFgSZopi7SM3HDRcNUtw4LZ+FStaNU
         XAYA==
X-Forwarded-Encrypted: i=1; AFNElJ/O3OuuXcTYsGIbY8zJU5Bfsv1DzQcXOcz86fz55MvT3mDQMZ0WU7beFgYeLPGQhJz3iUub4QjGCowV4Yvp@vger.kernel.org
X-Gm-Message-State: AOJu0YyNYQguAs64EGgsNUuzdQrXEUA1rFtqpO0KE/T0BfSTxUa8wp7B
	sxr2vhdYL9un9llr5vTOUDPt+Z55tP63wRq+mumnhchXdK+A4Gp85UIUpX+ECsF3+q5h9z0C0gZ
	595F1rJwNfGRhk89b+oW1IaeI3PFYswF7A+xnSTte2bojBOobm2JlW8x3MWUTK9Gxz9pD
X-Gm-Gg: Acq92OFgWZoqfpyJ6UAEk905ck1Yf+NHeuMu37za4JY2ag7AYOlymUZlUeDvD7biQhF
	hcDZMEvKWSCs8hrRL8dmtX9sA2JiQuuofC0qr7TVPEWzMJTtcSrplWH7tKjE2FLKhPmcV9faQKJ
	qShB/dyc6rG+fHnwRe/sxkRUek1eda+JOjd088yB8AX+ioquUPf7k+diGOOgkoF6lEPjwue2MSv
	R5Oma7ivU4MOVOA9JKd4i7x9yiSvGUz0CxcvjU+z784GAG+aN7AibHwABej103VFWU9jU2pUL7D
	hyA2/300T8GuAq0U7jKHvqqMMMmPpWF04jC43CkU6VxCP0OEZp4DlvHy44A4Mx5Bbc7E6k6ogqK
	gWuBDV/t/Hy/z3bwyYCx7CESD7l+2m/6sn/xOS1jxVZw/qw7bVmnRDZ9zhHfztSQA
X-Received: by 2002:a05:7022:920:b0:132:7ab5:6cb6 with SMTP id a92af1059eb24-1342ee42340mr2224711c88.2.1778683630079;
        Wed, 13 May 2026 07:47:10 -0700 (PDT)
X-Received: by 2002:a05:7022:920:b0:132:7ab5:6cb6 with SMTP id a92af1059eb24-1342ee42340mr2224678c88.2.1778683629453;
        Wed, 13 May 2026 07:47:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm22183574eec.26.2026.05.13.07.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:47:09 -0700 (PDT)
Date: Wed, 13 May 2026 22:47:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Add device tree for Nord SoC series
Message-ID: <agSO5yl2L8jLNVJx@QCOM-aGQu4IUr3Y>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>
 <20260428-dangerous-garnet-collie-dacccf@quoll>
 <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
 <afCxhUaxLEcbosvV@QCOM-aGQu4IUr3Y>
 <agJ-Qc71PloUM1pI@baldur>
 <agKBQ2rRtapoFlCE@QCOM-aGQu4IUr3Y>
 <agKGSaODUsI2Vj0A@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agKGSaODUsI2Vj0A@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MiBTYWx0ZWRfXxjO//lun1rZ1
 pRNXCJ870uQPlXwWIvTkWkp19Ma0SY2xf0h5etDspLJHYlLrgXO/Fn3AdhLnR64YZozuoO7b9no
 ORPPKkwv9vqaEis7Zti1I2P3F9ah1t0NXT7BhkpEYm73HW793wVzwXWx+Ll2LalatiQ3xzGeLPm
 GT8ZDlMmYpsDYKz34GahxXbAhz14R3yc+qXHfRdYk2FxDInCrPrhGRKSAM0Sj4dFXVg/WS2SWXm
 yy93wceZ/c5tBgwiqUcuRP2PX1Ll56Y+G/HTRJmYZk4oiEDRG8QVqGLFPLOYLZqJoCVkGSDowYW
 CHvQcwVWTj5KxVwvvwwagy7E2uNbXPlf6S4zJT5UF/2zQEMBShnDCvdWJUZxkbtEK5GRM8BCoMc
 i5DxmnPk5YVck/Z8KUXMXop0Up9s3AP5NTPFjDPghuxW4+ZY986+RmNOu/ISOCBD5aClwRqHkHs
 wREaqnq9PGJYlFR1iqA==
X-Proofpoint-GUID: AjYPW8O8FZ2OZa-8S4JPlDXvjmO1bHHB
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a048eef cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EaVzfY0qQffko5ijWJIA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: AjYPW8O8FZ2OZa-8S4JPlDXvjmO1bHHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130152
X-Rspamd-Queue-Id: E19015356F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107365-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 09:45:45AM +0800, Shawn Guo wrote:
> On Tue, May 12, 2026 at 09:24:19AM +0800, Shawn Guo wrote:
> > On Mon, May 11, 2026 at 08:12:01PM -0500, Bjorn Andersson wrote:
> > > On Tue, Apr 28, 2026 at 09:09:25PM +0800, Shawn Guo wrote:
> > > > On Tue, Apr 28, 2026 at 09:28:47AM +0200, Krzysztof Kozlowski wrote:
> > > > > On 28/04/2026 09:24, Krzysztof Kozlowski wrote:
> > > > > > On Mon, Apr 27, 2026 at 10:34:52AM +0800, Shawn Guo wrote:
> > > > ...
> > > > > >> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> > > [..]
> > > > > >> +			compatible = "qcom,oryon-1-5";
> > > > > > 
> > > > > > I asked you to send this binding WITH the user, because they go via
> > > > > > the same tree. I see the user, but no binding for it in the patchset.
> > > > > 
> > > > > And few others like SCM are also missing. I am talking about this many
> > > > > times already, to multiple vendors, and I am still surprised why people
> > > > > on purpose give more work to the maintainer. Well, not my tree, so not
> > > > > my work, but if you ever wonder why your patches are not applied for
> > > > > longer time, that could be one of the reasons.
> > > > 
> > > > Yes, I should have sent all those bindings targeting Bjorn as part of
> > > > this series to make it easier for Bjorn.  But I'm not sure cpus.yaml
> > > > change is one of them, as I'm sending it to Rob.
> > > > 
> > > 
> > > Not sure if you have settled this by now, but I can merge such binding
> > > change together with the dts change.
> > 
> > Thank you for the offering, Bjorn!
> > 
> > I will include it into dts series if Rob hasn't picked it up when v2
> > of dts is ready for posting.
> 
> I'm currently targeting PDC binding to Rob. Is that something you can
> merge together with dts as well?

Never mind. Rob picked up both cpus.yaml and qcom,pdc.yaml changes.

Shawn

