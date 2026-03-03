Return-Path: <linux-arm-msm+bounces-95161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K9WEoAEp2k7bgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:55:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B61781F30BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2716730BF43F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 15:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A313B8937;
	Tue,  3 Mar 2026 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djYY304v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5A9feiG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDC347DD58
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553096; cv=pass; b=AFAdutpGVvqgp3Tratsn2J/25aanrpZ+bUFd1DZz5Nt0ilXOnm7VwHWaxHQ1W3Em40mi9esC9U4Hj4lIeLx9x4jPvztkOBwPOfHAKZa4WPzglRxs4RYTSPElMxFjxFt99+AemTNdq1pvuRCkPn4Rka/eaQz5nbCig2QIfHsgddE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553096; c=relaxed/simple;
	bh=vbl34SJpzzjuAqqO9ktWrHpqcdl29EDkYq9wDnmOJEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehyVgT3HG+Ow81r5UqSwOscKXbjaxodM0fn8BlZPB2xcjatxA2YIzo07HZNjPCaxAiqCoLVDyidvIGmTNCWOLNXx4XUXDnlfUM2jwJSySaC5cxXfwILqksqGXkAJ5nJ+DvPpZiJcxj03uM794LTSdGHcxanY4fBexsUZ/mJLCZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djYY304v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5A9feiG; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n57B1838259
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 15:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xl/ZHYBvKe1V6CDovCzNp0K4Ubvfhcf/6ETrmyAX/jI=; b=djYY304vNkDYw9gx
	lsTEQp7mnpnXl48WeWwce1fF3wdwIh9OflG0zMP6t0/Sk7Vw5KmU4LrZ/X6+W+0P
	11XwH+iTDi/MrhbVlxhDNrREo9yzQ2TfOpl3yV/PGSn0dw2SLxMF7M21nInU9iPS
	kH/X5xQUOolWqM/Ke5Y0cZjrsTb/SjKnxe1YUO7ZFbCMMKV2ZG0PMKDCKIyyhLzi
	XdZdTwn1i1+r8V0r5CFAKd530kjwiEHQjDhHgkBhBl2Njh6+zM8tp8+o79GDC3/T
	bE8uxlqR7+8GXVVxlIPdDBd2RHmJiJ7AmEjX71y4qrR/IcPOSLqeOHgbqK2y1RrV
	h9N89Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnnggass2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 15:51:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a00530c98so84587846d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 07:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772553091; cv=none;
        d=google.com; s=arc-20240605;
        b=X/qqKhwPzdVzUbAGmeXfMj0AHdu9Qyvr9auZAXd4EY/wToSbZcJdB/8GW0YIMS3Wco
         iBM7hvqGR/ZTeXsTf9CJMHiqItTAQSUq20ygj4N1XQk02ZaTZEwcHccHrekST8vuhM6U
         r8kcBNT7mPrHISeX/GxgA0oGmwIoiKM9mnpK6ekf5chQ+iHp0L5+1d/MSVO3GsJ5bOb7
         32ZRlNhs+LCdLW1GgoZZuTK/pt6I5eGjx700H87xYlqrRYwB2SX6bXx/oA4AZ/0xhUtY
         WvWYTWh4Vd+PfVOMqS44wUmejzoccRFu05nBQ0QDOYKd9D1Ux+iJq+Anfz9C+boJ1oEL
         DJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xl/ZHYBvKe1V6CDovCzNp0K4Ubvfhcf/6ETrmyAX/jI=;
        fh=RQCTQaIb8MJsbVnq921Xx2hx53282gf+azvFIIcmEc0=;
        b=kbooRHojAPvBO+UjEtuoNuVoQpAZySjX4HRcw2ynRP4+4ZGVjaSTLebsaeQV+s/HP1
         LMEK+HpH90gG6cM3J+cODexCLQOmXf00RtODgCfVlk7OF2beTcI+8GFqv5y7EU08eine
         JTjOGiTN79BbwYEXskFfnf84IEa7z2z1gGNa9xQADIRfcBGDEgPTtOOjg0siyJpOnJm4
         RLBQA48mVcHGs2vGeAahC06D7HumrKTWhjFHR5rl+t7vIsYB+aFmjEjZHjbYEx/Rk4Ja
         3lxhZhT6tsVl+9tjGeduiRTo6dyiwALV5JlS7npK+yK61RB4FASKfggDe0lwGTjL9sUr
         EcMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772553091; x=1773157891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl/ZHYBvKe1V6CDovCzNp0K4Ubvfhcf/6ETrmyAX/jI=;
        b=M5A9feiGFiYnMarr7I4vdQ8EPEs1iQaORhrWdO7JkOMDRKUs9+FyHq3V45weWZ4M8n
         ZjNFp/cF+Q5gHVOLvOecmHlhvV5W2+yvFHm4C+w1rxERnjOuxDLtek2ENUzcyNhMWVt9
         /un+JWDvgA7sbqS5HTIFuuktbWRNABK6s6Ewy2R6M57P1g1oYbgXfEVr6s//pOAN3bbL
         D1S2JG38zggA88PWP131vVayMx67g8Ko5g63/A/PXm6NVrMwHekwY+jLnmRChjf//ngJ
         LIIS0UsrNEBtV9cYei6kdxYn2VduGFpVYkVp9eHgRt8HyhHh7cCALt8SiXAx+Ukgtu+L
         4Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772553091; x=1773157891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xl/ZHYBvKe1V6CDovCzNp0K4Ubvfhcf/6ETrmyAX/jI=;
        b=pVVoBN73imh+EeuLs/FfpGQh/DLC0RaTkG+5inxn7lXdkXIMGD0BZ2Pn13Gz1R0EI4
         lp56Nr0aoHRoUAx6tfDnSd4SIlJlgoWpzK/VvZ3lVTksCAb3AKegXFnYIE4xdvmeA3Hs
         FEsrns2qeNIBAXnv0DxlbYeYw6+Z5WzpELJF1RcJega4zCN/5CbR2FRQ0jdWFJ0sVmcu
         PvJFW/w7YFhW07iCaC3ak5g3n0XBUT1A+EQsmmUt/bws3lIcISN8aYZ7Q5SBeVy0kCyh
         GJ0fNIMsK+q7M54sU08aOjVY1MWrxiPHAC5u4dsZl+P1AvwtrXGRVKrhheBgSf0Z9bbs
         Sz6w==
X-Forwarded-Encrypted: i=1; AJvYcCXGJyptkqkArSf8KcJ6KZd+9zLKW2zQtkXzxUvpw1j2KL3Fpgmdxd5nYoyO3iplKSA988Qy9wFU+ykCvyMH@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3c1GZXygtgtJNAJjziE3gM1Jir/FxcDQaZ8NLD/6bat3+mUL
	9XiJHc15xdb5yvp/rZ1Ulnt+ApSXgSg8HlHamh0snpcHJFIAYYhq4UIOFbabizsjz3B2TgVgJS6
	KBADWP1yiY5SDR+5FMk6zyRLP1MZXSJCmlI4AJ5E0lqztN9bbbV/OSG5/z9D+Zdjsjn1Xd7w3P5
	cJtYxHHbwFDMTVoUVf0zQTsbOvUNGUotlvljszVyBT7yw=
X-Gm-Gg: ATEYQzzOCfODTotoKm/cCyKHccFrCu9zrlGHwLwhFiYX4u0P7Funhk1PBAiN4BuwE2F
	BYbHe0z9A6CMpFB/wMPBd9WGOOmEcXAv1+hZaeC+sTnF3SKko//q+y5m1jP+9eayBtt+x2QveNj
	/IJ5S60qgOyNfY8x9ilm+yZvkZhUb2iqE6fxPzftcvuPMu3gOGh0B0xjL8a7pXd7lw0WvDXLL5i
	EKRho08m7vpPHdGBvP20Q7oFJyfSttqzztT670B
X-Received: by 2002:a05:6214:519a:b0:899:c620:ba1b with SMTP id 6a1803df08f44-899d1e479abmr220697166d6.52.1772553091238;
        Tue, 03 Mar 2026 07:51:31 -0800 (PST)
X-Received: by 2002:a05:6214:519a:b0:899:c620:ba1b with SMTP id
 6a1803df08f44-899d1e479abmr220696896d6.52.1772553090589; Tue, 03 Mar 2026
 07:51:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226100444.857406-1-loic.poulain@oss.qualcomm.com>
 <1aa1bf9a-ee4c-40a6-bcd0-cd3866415663@oss.qualcomm.com> <CAFEp6-0Pe7t5q11K9fAFkbUEuLOmsBp6rE4FFvW6o99yuLqS=Q@mail.gmail.com>
 <3eae6261-f61d-4d05-b1c6-393855f107a1@oss.qualcomm.com>
In-Reply-To: <3eae6261-f61d-4d05-b1c6-393855f107a1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 16:51:18 +0100
X-Gm-Features: AaiRm51UnmxEWi1K6tgHqpTtJq9MzvFrSvg8clsU81jDcppBvFOT5XGKyZemhc8
Message-ID: <CAFEp6-2WMi-12oAqaW-U32x8m9TP1JY3NdrLtUSRK9gn57QPOQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Populate media hw_revision from CAMSS resources
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=P7E3RyAu c=1 sm=1 tr=0 ts=69a70384 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=dOGmwKFHaaH-Xkl6nZsA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: pPrCsEbOjr1huCNR_NyzTYokA5aCBwWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEyNyBTYWx0ZWRfX7VZjuycSXo2I
 FG6mIy2Bbqyjobn8iQpqs7gcWqxPc2VJlshMW8UZFJMciMzD4i0fhd4Cr2aR70AHdVNrZd90aBS
 ZOvqJQi+JW+z39BI3doldb1bRAYIex5IuayQGLSFOD9zD8yBmzCN+6aL58ASuDt6i1wvH5rGYYV
 maa9HPWd9X1Qa6sWImcNK6IzKqIMEniyFBSADF58lIzKcHmSzk9AP9PTAgRymslUbOcvsw5tITY
 nOxDXFzWCzed0vXb5zJT6DwaZKQnxwZRYCvvA8A3wRHU9oJml1Dul+w4dl/W//RR8n5owYq1At+
 qMvaiuI6uhWr+0CgRfpyTfBFUlBc4OqpPhTXR56A7M9oGzeAxgVO42q9KH3kcuwl2hdiKybHCFq
 hjE7+BDmIDFrxSmeG0Z4clAfF1WAxhCe/MpfZA1BXZvbGgPLDWWMCCkIoxyPtxZE/C/8Eb89htH
 WrpcBZ5cLvIAhf7sUiw==
X-Proofpoint-ORIG-GUID: pPrCsEbOjr1huCNR_NyzTYokA5aCBwWQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030127
X-Rspamd-Queue-Id: B61781F30BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95161-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 4:51=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/2/26 4:28 PM, Loic Poulain wrote:
> > On Thu, Feb 26, 2026 at 2:50=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 2/26/26 11:04 AM, Loic Poulain wrote:
> >>> Set media_dev.hw_revision using the CAMSS resource version so that
> >>> user space can query the hardware revision through the media
> >>> controller. This can help identify the exact platform variant and
> >>> adapt behavior accordingly, for example, allowing libcamera to apply
> >>> quirks or enable features that cannot be discovered through standard
> >>> V4L2 or media-controller APIs.
> >>>
> >>> Reported media info on Agatti/CM2290:
> >>> Media Driver Info:
> >>>         Driver name      : qcom-camss
> >>>         Model            : Qualcomm Camera Subsystem
> >>>         Serial           :
> >>>         Bus info         : platform:5c11000.camss
> >>>         Media version    : 6.19.0
> >>>         Hardware revision: 0x00000001 (1)
> >>>         Driver version   : 6.19.0
> >>>
> >>> Note that this may imply that the camss_version enum should become pa=
rt
> >>> of UAPI.
> >>
> >> Wouldn't it make more sense to populate this field with the revision
> >> of the hardware?
> >>
> >> I see that CPAS_TOP has a TITAN_VERSION register for the newer chips,
> >> while pre-Titan platforms have a version register at CAMSS_BASE+0x0
> >
> > That could work, but not all camera subsystems are based on the TITAN
> > core. For example, Agatti is different core but also exposes a similar =
register:
> > CAMSS_A_TOP_CAMERA_VERSION
>
> Please read the second line of my prior reply ;)

Oops, indeed, I overlooked the second part. Thanks for pointing it out!

>
> > We therefore need to ensure that the version values remain distinct and
> > do not collide across different core architectures.
>
> They seem not to be, but listing them all out would indeed be good
> as verification.

Ok, I=E2=80=99ll check that, at least for the platforms I have access to.

Regards,
Loic

