Return-Path: <linux-arm-msm+bounces-60075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 244E0ACBBEF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 21:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA0E73A31C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 19:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632A51A0BC5;
	Mon,  2 Jun 2025 19:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBdzeICx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEFA18D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 19:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748893635; cv=none; b=mjQaQHgS2CQT7dXOqqDCioeftD/fHYO+XafmYfoIVA6quynaW2ADsfpGLNCV7ipbxgbf+8ujyw0CXiFMKJGATBbT5GD1Q1swz5uSIYp1G4pY2BuQW4rJhbAAl8gxnqgBPqO3xf1SkCdpb+KLJUIlrPM6YbPY+F4RMNcb1u7JV8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748893635; c=relaxed/simple;
	bh=T/aMHGXQ9Dvea2CWJGS+C4LVoUSOKu54gzrWsTEtT7c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Mss2N+tqvbfNdnaFs1gNvFDAtLGXXiCAA/dbe+LNFvVvtqQunp02zsqj/n2DRcQttlPDWfdD5zpJIT8w/1M7RkQ95tGAPuSCTUnZIkwbbPhCwEbyKnLAao8bF6u7A3MyeunG+vrqv313aKKDjdgDUj8cYBFszOq9Ll+sYQ1OiRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBdzeICx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HP29J023324
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Jun 2025 19:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pv4Gvylo8FY7mjR4b9XsVtGARKI/SKacbF8jlSXtk5Q=; b=HBdzeICxNFwLE18Y
	C2Dg/v1rBYEUP65eqI6/FaYeqN/Ct0cinNTX1DiNk8746RkYf3qwc60F1L6Xq6FN
	Sc27EgduGLIQUcF6RuWGpDGKtwOw1s7MyxyXLKjGDJ1uz24utW+u9Ym0PXDgZMGo
	hNsvdLm8kWcDYwShwLPTsiSFKllzyssaU8CZO2r7oVXPCMZbDibSngGPL72Gnw8m
	qRPc1tg2Dy8LaS/2yQOQUYSTdCfdoorX8Pj8h9je9YWc1zJxRp7yFAam/6Ayn4ra
	LFMx8ZbsePRhPg73AIC17G4G+ZMMy8uv94974YqwHVAP/27uD4KOYbi4EkfJCfgj
	QOGmpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471gb28bvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 19:47:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53e316734so809352285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 12:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748893630; x=1749498430;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pv4Gvylo8FY7mjR4b9XsVtGARKI/SKacbF8jlSXtk5Q=;
        b=OZ/96l+HA40gXjtSW7dtzwI1EMquPI8vuy0PXbxp1VDR2qFacWD3S0TBd88e7uj9dd
         Kqw/QtUZnAJfKKzkHlgcSt8hVT+jSaE3HvI98Pz0EsZLyV0Wz5JrYzkDkKwePvQwmRcq
         wX8j2OHIj7gchiErPghZsJrahnTVYt66dFI5sAW1Avb/VCi/jkUY07ymlVYeQp0tWrQG
         9O1l10opbscHu2kSz+U0EqV+fnxDvi7g5phoVMWTzxSQFHWpGpQFXR96EuCagn+Jw2r+
         QCOd/ivzeP0vlwKyJf7LVyoBHWqA9jsqcK6TRY48DW2ON4V+DhexnzhGDZAhYfag9mkG
         cdpw==
X-Forwarded-Encrypted: i=1; AJvYcCX8ArC1LWh7Dfc4THqSIAYHmFMgY4X7g4rSQhewXfQov90ElJDBqwTbklV0BQ+dd0e9E1Mjs5WwEh75ACCd@vger.kernel.org
X-Gm-Message-State: AOJu0YxAcZbnnmaUdOYPHtCPaRVVD28BWdFW/Voa8qv5WOQbZAvp2wxN
	AK627T/9EH6WK0om8lSx89HhqpSA0IBxijNPDFBD4AizfH1Ha6+mwrB8+ADqXjusYJFEjh79BF8
	BNjrHP1bDm/8hvHoZu/zKYRU1yqgZzIgtuefpvuDYOnhqcCkHyI9jBywFnLwXgRJ04q1o6V7eT/
	S4y4w=
X-Gm-Gg: ASbGncsfGxqRnD3Qv7lxrCfu1O5Q/O2rB806je2VHHcRadUpqK2oU3KJ+Owc+gtlH6S
	wxl9QPImLjlGT5rSTn1eAFgNPNXWik1BSyRvNJTnALgPF2zQ66LJCsdCLQJPTdtp/kQf70Op206
	uoxI7McuQb3aIy0xR9LIViVkvJlU9iOrYqpM4Agc/uTOidxmyNQRWiAmT3orAAMNGPc+LHOdhav
	Li42tzs5Z6xx5+GxgX9Zqh0kIF6ubIMWSu6ItApU0r/bMHLwOCNpy0LyRqQQwH4kwnE0O8HyjPh
	JavDisy05oKK5PbmTVjZx2sJi9F0pQRKZ/4lv0Ij9tegjb+iN+zP1pVvHhcG
X-Received: by 2002:a05:620a:600c:b0:7ce:be04:f838 with SMTP id af79cd13be357-7d0eac6350amr1384507085a.18.1748893630141;
        Mon, 02 Jun 2025 12:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEny2RN/ronKKFErzwQjb5Z23+FdZnMifLiGPoWjy39vEUqYNoTBvVufGWzNLvyNJaCwLvblw==
X-Received: by 2002:a05:620a:600c:b0:7ce:be04:f838 with SMTP id af79cd13be357-7d0eac6350amr1384503185a.18.1748893629760;
        Mon, 02 Jun 2025 12:47:09 -0700 (PDT)
Received: from [127.0.0.1] (85-76-98-209-nat.elisa-mobile.fi. [85.76.98.209])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd2790sm15451371fa.102.2025.06.02.12.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 12:47:08 -0700 (PDT)
Date: Mon, 02 Jun 2025 20:47:05 +0100
From: OSS <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/4=5D_drm/msm/dp=3A_Return_early_fr?=
 =?US-ASCII?Q?om_atomic=5Fenable=28=29_if_ST=5FDISCONNECT=5FPENDING?=
User-Agent: Thunderbird for Android
In-Reply-To: <3f386e7f-5e22-4c67-bb3c-202f13c94d56@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com> <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com> <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com> <3f386e7f-5e22-4c67-bb3c-202f13c94d56@oss.qualcomm.com>
Message-ID: <41C69F0A-605F-4B87-89EE-FE86A8DC71F0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EsXSrTcA c=1 sm=1 tr=0 ts=683dffbf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=kLrF3Jeiykx/AYV6VMbcyQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=puQWGBksFvoA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=WDWld9wBFKh9IeGoHG4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: N2zkdsbNigd2WFJO1lh-A6_W56K5NeKh
X-Proofpoint-ORIG-GUID: N2zkdsbNigd2WFJO1lh-A6_W56K5NeKh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE2MiBTYWx0ZWRfX9syBKrCId8kS
 nxmL9vRUvNjA/IKS1Ki2rAYcg3fDjnhI/tSYBaeNLNV02bG07RMhRsnBFXqMHxYBZGlmnIju4Ne
 mBdsD0YPwpoEu12OkoerV1KrmQZO+4qiizgYWrItdAiZzNxuZxDEM8JETI8frpVoH5+3fhhWrYv
 JDMaBNnfiJ9ebTqKwylndnLlF61YTpckf1gS+kLVGFHlQDn5HwDYHxv8lWklVB6SKsA7qo4CcZq
 ykuSZbd9bncxIH29l2QAhxHflDoX5pA6NPWWq8r2R4WyW25ucjHqDNC0p1+A2/mp5a4BsLPZ82a
 MMI7MVnXw28tmu6Sx7WAjHWnDcAZd6I9+NuXC3xc65pqVwl6rgcOaRlo86cCIGQhlt4nYKR+2aj
 /Q4L4d2ZjifuBmS7j7ACxSFjGkHfBU3NC2ipQMB5V2y4DnLw/QlcDAlbEtf08b0Frlgv05bN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506020162



On 2 June 2025 18:54:12 BST, Jessica Zhang <jessica=2Ezhang@oss=2Equalcomm=
=2Ecom> wrote:
>
>
>On 5/30/2025 9:04 AM, Dmitry Baryshkov wrote:
>> On Fri, 30 May 2025 at 02:15, Jessica Zhang
>> <jessica=2Ezhang@oss=2Equalcomm=2Ecom> wrote:
>>>=20
>>> From: Abhinav Kumar <quic_abhinavk@quicinc=2Ecom>
>>>=20
>>> The checks in msm_dp_bridge_atomic_enable() for making sure that we ar=
e in
>>> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant=2E
>>>=20
>>> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY =
as
>>> msm_dp's atomic_check callback returns a failure if state is not
>>> ST_MAINLINK_READY=2E
>>=20
>> What if the state changes between atomic_check() and atomic_enable()?
>> There are no locks, cable unplugging is async, so it's perfectly
>> possible=2E
>>=20
>>>=20
>>> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario t=
hat
>>> there is an atomic_enable() without a prior atomic_disable() which onc=
e
>>> again should not really happen=2E
>>>=20
>>> Since it's still possible for the state machine to transition to
>>> ST_DISCONNECT_PENDING between atomic_check() and atomic_commit(), chan=
ge
>>> this check to return early if hpd_state is ST_DISCONNECT_PENDING=2E
>>=20
>> Can we really, please, drop the state machine? I had other plans for
>> the next week, but maybe I should just do it, so that by the end of
>> 6=2E17 cycle we can have a merged, stable and working solution? This
>> topic has been lingering for months without any actual change=2E
>
>FWIW, I'm currently working on the state machine rework by the middle of =
next week=2E
>
>I'm anticipating that the rework itself will take some time to get merged=
, so didn't want MST to get delayed more by this series=2E

Yes, that's fine=2E I really want HPD to be merged before MST=2E And if I =
wasn't explicit, the state machine must be gone=2E Link training should hap=
pen from atomic_enable, detect should be reporting whether there is an actu=
al display plugged, etc=2E  Current code must be dropped=2E


>
>Thanks,
>
>Jessica Zhang
>
>>=20
>>>=20
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc=2Ecom>
>>> Signed-off-by: Jessica Zhang <jessica=2Ezhang@oss=2Equalcomm=2Ecom>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_display=2Ec | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display=2Ec b/drivers/gpu/drm/m=
sm/dp/dp_display=2Ec
>>> index 1d7cda62d5fb=2E=2Ef2820f06f5dc 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display=2Ec
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display=2Ec
>>> @@ -1512,7 +1512,7 @@ void msm_dp_bridge_atomic_enable(struct drm_brid=
ge *drm_bridge,
>>>          }
>>>=20
>>>          hpd_state =3D msm_dp_display->hpd_state;
>>> -       if (hpd_state !=3D ST_DISPLAY_OFF && hpd_state !=3D ST_MAINLIN=
K_READY) {
>>> +       if (hpd_state =3D=3D ST_DISCONNECT_PENDING) {
>>=20
>>=20
>>=20
>>>                  mutex_unlock(&msm_dp_display->event_mutex);
>>>                  return;
>>>          }
>>>=20
>>> --
>>> 2=2E49=2E0
>>>=20
>>=20
>>=20
>

With best wishes,=20
Dmitry

