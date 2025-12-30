Return-Path: <linux-arm-msm+bounces-86940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69292CE9436
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 10:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6BDC3018957
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 09:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAB52D781E;
	Tue, 30 Dec 2025 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+s0fcxV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZvPrZUhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E578195811
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767088254; cv=none; b=P5iqjf8Ct8RRa5cZQAxHNkv8MGfd/Aap7o6OB23PZV1TyXiDOfSr7NHPwjENuKp7Sk2Pwo7Ow3fOBMGwBblqLq1lrj9VsNcaTMye9Ds/hwSBUKCVAPgBNtFbMT8x/NQT65Y/gIPmkvq4veUDgK5TeJGQAJaHP0/aE/xURgkfKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767088254; c=relaxed/simple;
	bh=AezMIr78RfBsrmMoauKZQnKcpLtYq7A47d6aa9ubbLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMwa1Q+dRk/1J0OE1ogNiU55FmiPKDplqXzxECt6F76lRYAOpYLSfq2z78AGMRCbk44imZ+7Nvlz9eGZbqo7b/PBLlAJq6YH7H0asgE4rAWEGV00eOxVRsMaGnXp+xGkSBdku5RKKQQyiSqhwELSZw8QvaX1Jxnc84wioEO+NzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+s0fcxV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZvPrZUhM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTNBlxf2058360
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AezMIr78RfBsrmMoauKZQnKcpLtYq7A47d6aa9ubbLA=; b=A+s0fcxV9wQMugJH
	V4Jdckn5hb+r9TB30GQcfdIAtMp0IiiTUJvUzm0LtqDD1rX+sxlAH3Mi50kk9gjz
	ss3GgtbZQ/SxoJjif3QBqs2KdkSdD/n+Dl6mumk3X7M4Z5frVIZu974+KYdVGgtC
	aqALJPdOLKEEqtQSV9z91WeyXDEmL85TH4vKV6sRHW3LpSdCW/JEKEvT4AWCAwpw
	vbz/KFRAsc7zICuEbrORxl/q+6rKbl3aU+COYhsbjwyyhRK7oHIDkmT49okZ9qoW
	x2d6uOS357XH3omeF1mgEwS11SZC67WTrjeDxrSkPR4T1xNTv1R3Bo6/dHFRe7jU
	DXlfBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sgsfec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:50:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6855557aso226159331cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 01:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767088251; x=1767693051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AezMIr78RfBsrmMoauKZQnKcpLtYq7A47d6aa9ubbLA=;
        b=ZvPrZUhMHt0sVYFtbtKMpRt70hp+vS4n5ZBrHyBCdoqkSgEJiOVSaBili0Msaa6KZL
         WhX8xrcyNXXK4QDCvM3kVMpS68q52LkvHzYRD8drv8CD+D/eufIdIZDAKdkA96UCE5+p
         4xHujvXx/Y5vLrHUvMbQUVBjepGWFG3PB9/Udp8eNrPKG+IY7+IO72Wlmp2GvBob9d2E
         HCcNiA9tDftvf0tKVW576dWNsA3p241gFcpQpBLHx52m0UDly+06VBpZInHbfSXHHMey
         J5HALJNKwQNHaLGdPRXeWLNvWnRUpXUqTdV8uYE2QB+MmAV2Lx3Kgto372cyPz+qAzyY
         jS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767088251; x=1767693051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AezMIr78RfBsrmMoauKZQnKcpLtYq7A47d6aa9ubbLA=;
        b=LS8GHB2ctJreYn0M25sLZ0CjZFuA7xXNEN1ztBPGIfddwaNOY/u0JkUa5lLBTT2mo4
         q6JG+9ykFngD9s9hzgXjP0cqSmq5VUsjja3kw02JvbJwgmjHcLqLpBB8pRkO1Ix58VnK
         Y/1mJ50VbQrZ5S7BJL5PFgXUxESIU0mD/fkh9qUTnaPHXsU+Un5uF2AsdjaR9WTLWybQ
         0nfejuPgijslgnw6QWu0rzmx6A4NbM3aj7uMzSQjHCQWFib7/UV1Zz/PyBcsyoljSOrw
         o+szY1RIrzViXZvIGGmikzRGq8aRcEy7UkEQlHWgx+spGdHfXMMHyg4fdtGizpdKF6+I
         VieA==
X-Forwarded-Encrypted: i=1; AJvYcCW8gZz95GnKY2LPD0N1ejxE3EVsImC1mqkLJbMesyN/HaK4w0BZ6L6NOBrtE91hmwWMkQfUtBjQzCy/EyIY@vger.kernel.org
X-Gm-Message-State: AOJu0YzQObZhdOz0kmCN0dGTz86o6Rii0gr7+L8yQpVMn82yjfMWZsdr
	9HMXo1mBY+T3uFz2h6xPldQaOeVyqa6KMzcjvlUNwDUKs2wUEEupiJIurKiBWnKhoRsXBxBlqmQ
	gXnm8s0yYJeCrJlgjE7hhoawrGI2uft5W3ZdKNFF7qYAIzmCp+kTTLPM6p2jyBV5VTvEYJfeYRx
	5+GKbnSETAiqtvnbWpkVnOLu5eOMwjkvAkkHn6f/Bb3t0=
X-Gm-Gg: AY/fxX5d4Z4mSMcoU14a3dtlFPTA9s/fHAx5WrwdjJhsCYNGB7TH9b6IR6gsuV2V4na
	S/gqbBH0JXFDaSSBUm56ptHyFzMTf2mlraeIeEue+ZNI3ikkQKLCNOSv9koK3T9MNouO727mbb6
	OajOsaZqyNA91nxlXAv8mRFL5AHOdi5nyr9kSA/wHP+adZexLJf+X0uyVn3d2l10l0s0EJOhsqi
	xBF75Eaw6EPyclHfXYGchRQ/Dw=
X-Received: by 2002:ac8:5d4a:0:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4f35f473c35mr604284851cf.36.1767088251007;
        Tue, 30 Dec 2025 01:50:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBZ8wGhLditZxalNu2tU6+Li0eUjoydVwABPejTw07ZO7ZImHvKWvoB21fJbJ3aHwmUgMYAoppRtYmiE6I5QA=
X-Received: by 2002:ac8:5d4a:0:b0:4e8:916f:9716 with SMTP id
 d75a77b69052e-4f35f473c35mr604284681cf.36.1767088250633; Tue, 30 Dec 2025
 01:50:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119105615.48295-1-slark_xiao@163.com> <20251119105615.48295-3-slark_xiao@163.com>
 <CAFEp6-23je6WC0ocMP7jXUtPGfeG9_LpY+1N-oLcSTOmqQCL2w@mail.gmail.com> <4c4751c0.9803.19b3079a159.Coremail.slark_xiao@163.com>
In-Reply-To: <4c4751c0.9803.19b3079a159.Coremail.slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 10:50:39 +0100
X-Gm-Features: AQt7F2p7sKuK-wJ52q7OokTd49nAsSxFeSzV0kjXlxjYiHpoVgcVY-YAufvZoHE
Message-ID: <CAFEp6-2NBa8tgzTH__F4MOg=03-LO7RjhobhaKHmapXXa9Xeyw@mail.gmail.com>
Subject: Re: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for
 Foxconn T99W760
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA4OCBTYWx0ZWRfX9NtiFlqhOZ5y
 xNhRqMv56kYa0fiJDw/yB7EM3zs/4Re/gWJQfvg2y3mLdDiOa5lRasELx+rfOUEho+6ERldY+A2
 q0gEJkl+zqSyJ8Jmg79tsfMCSbG/BbwIzoUu85i4gZ23wU+T/O3wnu9yDO9P1xNgJp//P+JQLMu
 0w+7EWfB/PSlEZdfTWhVJAAsq1ZvfwajPgRyqmHgv03ErAa60SmO0o23AYhi9zVsEldJAm+1mSb
 rsToNnHcN4ceh3ero7A7EdYQRNJZH/VStPIfdwDbSTTjcyslYl85RlEbddzLFCz4IHv4ZmxuSxa
 0s04TFPbGgKHGD6o4qyPed5zK6ke1hzJHzmqqZnE0xxX2M7EbQ0PmEQs4VP4bjOixbMpUUypku5
 0gav4O3rzmEnkLRH44HenI6ZTIvej5en2CQZ43L9X4g+6tylgO33gTA19Afsa/mKdsTOi/+Xz6I
 dUIx0dLnJWD4X7E4/fA==
X-Proofpoint-GUID: sBYq50f7UxWKBO-R8c-LM08vFfP_NJ3R
X-Proofpoint-ORIG-GUID: sBYq50f7UxWKBO-R8c-LM08vFfP_NJ3R
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6953a07b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8
 a=EUspDBNiAAAA:8 a=UVxOvI1-KtSAPj58WwEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300088

Hi Slark,

On Thu, Dec 18, 2025 at 9:01=E2=80=AFAM Slark Xiao <slark_xiao@163.com> wro=
te:
>
>
> At 2025-11-21 20:46:54, "Loic Poulain" <loic.poulain@oss.qualcomm.com> wr=
ote:
> >On Wed, Nov 19, 2025 at 11:57=E2=80=AFAM Slark Xiao <slark_xiao@163.com>=
 wrote:
> >>
> >> T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> >> architechture with SDX72/SDX75 chip. So we need to assign initial
> >> link id for this device to make sure network available.
> >>
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >
> >Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >
> Hi Loic,
> May I know when this patch would be applied into net or linux-next?
> I saw the changes in MHI side has been applied.
> T99W760 device would have a network problem if missing this changes in ww=
an
> side. Please help do a checking.

You can see status here: https://patchwork.kernel.org/project/netdevbpf/lis=
t/

If the changes have not been picked together, please resend this one,
including tags.

Regards,
Loic

