Return-Path: <linux-arm-msm+bounces-90060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGNWI2YYcWmodQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:18:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 124605B2A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BACA89EF41F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 17:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D579835B152;
	Wed, 21 Jan 2026 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKi/9ny7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPfvPrL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C822FE048
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014808; cv=pass; b=IYXSmsLefa/IoGMrGmm5nF+ma2wylBmvQWpD2weZodFeGbAbpjaIjvnlml+LZJw23+5SXzVK81X655X5DqEKkqhwWXzOZL/TqQ+SlL7ZqqnZdK0uoHkS355OeQP1Nw0QVgARW13BwdaWcOpzak5HJWdGfKhco9qbyoCfNDzHUzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014808; c=relaxed/simple;
	bh=+joYYSvt6O0WzeTvPCyBVAm2AiyPwakHVoRSJLX3DYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prwsDj7yQ6zzZ3TyK/PqeoB7sdYI6zXI4wS+khj7PTxxVXi/BvaX/BAubntSFPNcHhPK5/cKJSrJnGDrephg+VtJgnMw9+JHJ76io2CComDUSom9mHOF13aKSgj/A8vouVuoqvODJlYv9XhUPDDo/dQCWbs3iTbBuZemkax2fso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKi/9ny7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPfvPrL5; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LGtsQj3991329
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=; b=DK
	i/9ny7u6sYA3xbSXbIQHGKSgaSeJxqF1CQpODMhYJLhS9hlss1d8e6vpsgPmAq6M
	OUCTtwcZSlrgqTTEfRp0ot0c9upyzZ3agHCzJ4izV9QA9HtfoYDsz1+5sq4xyXlV
	WqEeTKFxHUpGHzpwQV8CmihLIlOpO33U3duwJaT8uxNEH2ZY1TVo36Yp2vjOIYdW
	w8LC86fSNSGWc4GbC4oi7L55J+zLtLU3YANJ+FrrGyxmHW3uXwdA4Pt572UMyrOM
	jsedXPJ4CfvusCELtzQjx2ymDTDv+Xk75Y99HC+/uqFrouioImZBg5vX1LStwHHk
	zw+arwhsAZsvMDM2YZBw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btpm4339q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:00:05 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11b21dfe918so28055c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769014805; cv=none;
        d=google.com; s=arc-20240605;
        b=dEU0TWkbbye+hmZ9F581isyalJgv7uk7uGda0/EYFI6RLRhuJz4ZXaaSl1Pqc83Qap
         sOFMY5vds1c3zc3lNqGecfl7e7cUoY5ytnD0vmg1yA+LICaikE9+fl+aDq3+pan4rD7o
         Nv58wWXumc77s+VcgDv8rIHSqq1kcsv+wP+0BoFhN+/Nj1tFAGRATahiJqfMoBjswVN6
         Siyn95WYYcfhNBKIsJcRymnOR/xSlu4wVv97T1QiXF+TU/PiG92UX8FSyiUZD/JKGX3v
         aNDz5ozIkzvkMvhNerg34zf07ci0FIjcot7CoyIz0WzF2BgiGtZXfpKe2N5O7+ttai1M
         kEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=;
        fh=CafMJyozxzFHp/W56GStP8/1WuDV4SSHKfBcwC8Qt+0=;
        b=Xvc9SZaIJRPN9hjU/sIyiFOjTtD6DzcEyPyHoWlQkGJfrruYZTYJ/uZi4bIwzXgepW
         oyO4Vg1wnQQdudYE7xHfWFIM82geHQk+NiTHG5EDu10oxjz8ISI5bYh71kkDouoQjGhU
         rWLbzqoykmQZhL8zUVYFpKadOIPnosj/XomWZLbQLF9kkbCxi5kVZ7a0sjF2NNzGOrn9
         VoVNVoABWp8Q63TiOp+zW+/4L6INucsimn3Bn23kN5M/9RBk29NZcF5yPz2fylNJ5foP
         ZV35fT0bNGT022/74v5Y3NYomY7yTxxIZzt23U2LPXHxKi75V8QhHKhjjgZoEoPLgNnw
         cKfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769014805; x=1769619605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=;
        b=RPfvPrL5Vub9XNUi1CkfP19PQvufpqWWhDd0rhngeFc7vpH0zZvcWhFbyV5fYwJLF/
         53MLiRMUvBGdqlb+LnEUflcyjZsYeea8UdWF6oI11sW1fNsc8D37MLBoYrvjeTaLcYvO
         Snu8zfqWrqIFXugi6DXka87SjYRPscFwphSAFq72yK/EzipV9oPVIaTwaMZJXVxbrT5i
         6DIIXASnbjV4EMMa5cmIOnQHG6KXaRO501kdNgF4eswc+eBA96oFpEfunC+KJ950jxKm
         mquYZHPY7LyPRnGlP4EOZ9Qp/hI/WXFeumB+yjP6wkWZENtUUkGBsIn++Glkr81cwxU6
         mNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014805; x=1769619605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=;
        b=IyVMCbpILpSOOWviuyGxdH3inaZEWdqbocfZyzrG29LWTSnLcFGp6NVwrQabPOPP76
         s+ZyOjfUq/WkLYoV8Sj+3WguJyVtxsncXOziNTOSbhOb2j8qYY786dnpMexQg6iVr3r0
         D8i3RnPStNny2Nu1uUOq/wNT6AvxpdpNtRprNkqn+3bpmIhFkcOXPesBihPH2+ifLc5R
         DyLcI39DSG3qcIO6lG+n9MiXxRRuvyuaIUbNaml6ZQR6xxfefx01Jb7i2EhqMRKofBvG
         zeXrEky/HqnbY2FscGyOY3itJWUESJOD0zAlEUfJiVaU6uL1vFcPTrvBAVhhKTQ4UAZ2
         kL+A==
X-Forwarded-Encrypted: i=1; AJvYcCVpQPtrAP91g2aG1kSF0M5kU7UakoRA3qNQe7yhOcJkIsZlsSI61ChYAzGRJDP6Wrr6xoMiUHMS4sHYU11O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2A3nFRce5Hg56L9DFS4TvvKxWrnoskxNW9v0xADY27KJM+82B
	deHkAShZRYuonVR/VmHAJG8cNoDL2Cm6FlzZfiMzPPlwOIv3bCg4407gEZn/0zjzd36HZF9Tur1
	b2uGmImH+33rY7QBYDCQHc7Cxzx5pLpLYpEc5RycpwRN5Dv+IeYug6vDOwc7OilhmEn34yAPqOF
	O2ZflrKORthx9K/RQE4qMtjiuCBx38UjtHy4n6eKKfNGQ=
X-Gm-Gg: AZuq6aL2eV22DYwyfVS8y7XLq0//RL0yeQnQdlOQcWacPk7GyRuiLrMmDKAdLryOsCN
	pHrVy3/taL8QQ7LTazhjSa5g7DT+Gf74LC0ag7bPpGq5TWEJuvJqfBAijYtCqcDXdPYDVkpi5cO
	8YSJVcaPR+8/YzeV2SFUgMBkJznNz+BhjIgpmJbX9hIyJ5l2Af8q+H67LtInDzSlMUlwsx63qD/
	aml33qQBXMt22pEhXRkpR0wlA==
X-Received: by 2002:a05:7022:a8d:b0:123:3c24:b15 with SMTP id a92af1059eb24-12476b1215amr24653c88.19.1769014804750;
        Wed, 21 Jan 2026 09:00:04 -0800 (PST)
X-Received: by 2002:a05:7022:a8d:b0:123:3c24:b15 with SMTP id
 a92af1059eb24-12476b1215amr24635c88.19.1769014804017; Wed, 21 Jan 2026
 09:00:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221164552.19990-1-johan@kernel.org> <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
In-Reply-To: <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 08:59:51 -0800
X-Gm-Features: AZwV_QiWj0yuZPjfl5AAb2tqkVbhX91Ozb0ASrKflC4IjkW86-eixAz2tomYpLw
Message-ID: <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Johan Hovold <johan@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=69710615 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=RcnqT8zevFU4LWI_uFIA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: Nk_y3RXw9YNW3Di9GxpsVZ68nEl9wx6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0MyBTYWx0ZWRfX339Acpta/PBO
 wG/qQJwewHrmVlDOKCA9HgN7nQVAulZi+9Gmap+AQW0EG8kTif+m9YaDMX1h1OwoIc8bkcpCV+n
 edkpayopkG+WumsNhHNboAAjQt6DrMC9WoThJz6iaPIVVzZhyrsr5rJmo45tJZC0L6y9GfoXiy7
 auzEpxmqY0PF7ZeipfK/usmxbmzl+YOZp0kuDUmw+Y+aJqvbqUBXF5MEjyaVOzF3hc3RfyN8OFR
 Y9wJ8uru6quvJ3jo3gLHVVIXMUdTOy7uF14exgjafnGI3Yc5ZWLRuHlE3FMC4co/1UXch5+tJ3f
 01r2sHE7beRIMVuM9AMiUCPKcb3RLIApzko64+377XWXtyYc/oXlgjkoKpWi3p3fX0BXGd6pDUR
 cubI/t+RNLoQqyhFRe3LNXNa2MLX73AuPIFEoGhUYwla3ibzb+vJKURPLicRQXR0Hi6OBdLis+Y
 SM8GsUczZm4WGrJft5Q==
X-Proofpoint-ORIG-GUID: Nk_y3RXw9YNW3Di9GxpsVZ68nEl9wx6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210143
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90060-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 124605B2A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 7:17=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > The hw clock gating register sequence consists of register value pair=
s
> > > that are written to the GPU during initialisation.
> > >
> > > The a690 hwcg sequence has two GMU registers in it that used to amoun=
t
> > > to random writes in the GPU mapping, but since commit 188db3d7fe66
> > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> > > the updated offsets now lie outside the mapping. This in turn breaks
> > > boot of machines like the Lenovo ThinkPad X13s.
> > >
> > > Note that the updates of these GMU registers is already taken care of
> > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > > properties on a6xx too"), but for some reason these two entries were
> > > left in the table.
> > >
> > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > > Cc: stable@vger.kernel.org  # 6.5
> > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> >
> > This one does not seem to have been applied yet despite fixing a
> > critical regression in 6.19-rc1. I guess I could have highlighted that
> > further by also including:
> >
> > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> >
> > I realise some delays are expected around Christmas, but can you please
> > try to get this fix to Linus now that everyone should be back again?
>
> I haven't received any reply so was going to send another reminder, but
> I noticed now that this patch was merged to the msm-next branch last
> week.
>
> Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
> cycle and I would have assumed it should have be merged to msm-fixes.
>
> (MSM) DRM works in mysterious ways, so can someone please confirm that
> this regression fix is heading into mainline for 6.19-final?

Sorry, mesa 26.0 branchpoint this week so I've not had much time for
kernel for last few weeks and didn't have time for a 2nd msm-fixes PR.
But with fixes/cc tags it should be picked into 6.19.y

BR,
-R

