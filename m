Return-Path: <linux-arm-msm+bounces-103209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMYyHvGD3mmcFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:14:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D15BE3FD89C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C923B3044642
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F10C314A86;
	Tue, 14 Apr 2026 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrNGhp2J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyc+p1yX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F18307AE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190447; cv=none; b=vAYczMDLeM1JFkQfxHtCX9qt/dmdudycUSldBw+ExmaFN5n/1VnJiFe1xnKo+nm2/Upv2BW8kzX4HsmEpvGcV2NcSIr0Ecedt+wdmfWlvNtr2WXNTGA/mhyUTTgxLsKxQpPJ+fG7RIAgJmeodQtmZ9m/YzM57/FLIcBm9kp8Jk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190447; c=relaxed/simple;
	bh=UsNMBqjmLWQbvM8AUyYplT/5wP3mwFI1MglVYjRkjUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWKmuKpWV9P8ZQu0IkEpzHEq6ZEz0arFe/wm+tVlC7hFF1jSoh/fgNCDge4REt2miokGCLdoA8uSMn9MBZ+bQiGow5y7mpEveTTwi665k4ZsDa+s4a6noFXUDpF/K9f67W71IzezUUnLtjr9kSp0W5h9tiiYliyegxmcb+6nN5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrNGhp2J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyc+p1yX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHqCxd2071338
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ws9Zx/NJA/KZE7MfJoVb1XDq
	yrA9asC27LhY1GKTgrg=; b=CrNGhp2JndyRFJDAy0fcjJQseHDVG+fEp0+lOcvN
	yUbpj0ijwJH1fp0grtuYUUT9N3gHFbgpG5cIALvs9lKpL3thkRwTp4moi+H5iaVu
	eTnJMswJqCD3VenJeD2jcQ3WOLNJn/rGETY+siM6R+ua7kvXNIy98ZWxZxu17crh
	iLeyD3uom6T7uy7RtzYWZYtE/3R1jEWQUhN6k97gVInJxmgA3Su3io3FZhNRBjax
	z3IeGAPwaqQBzjIsU92L6diSfuEMezllXuk7/CDMBO7GRg5EYWMu5GO8BqjbAeZO
	qd1A844ZmSGyIvMewd1kap0py6kyabr/dNQG0BSKGzvAqw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtc282c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:14:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so85129001cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776190443; x=1776795243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ws9Zx/NJA/KZE7MfJoVb1XDqyrA9asC27LhY1GKTgrg=;
        b=fyc+p1yXl7kVtXZpNDln3i8mlp4EffRB0IoNIQP4vy1lYI5m65KN8w4J4BHnQU845h
         N9BRGFfmbZqhvPwGDeKVDkYrg2Zc3WMFtEcpndHFKGzFDvImN/x+Yn1xwpiC1UiZLqoG
         GZBnpWWq1K3Rnp5YtmCafyRFTj25nbHpqW5SGCW3dvwEBn7VtJEiF1kvD0mL03yWPjYG
         vR/3MsQhp0FN0fgDaOwmnu2x39PUQYZyOEGnM7FL552HrsdjCA0D9k8p1BqvIrhzgw5K
         TaeaDl1ZOZIABDl6V8Y/G5Fri2gVdnhg/MEacRSEJBAYB/bbia2sjg92AOy+ejUHO4ew
         GfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776190443; x=1776795243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ws9Zx/NJA/KZE7MfJoVb1XDqyrA9asC27LhY1GKTgrg=;
        b=kw1GnFMO9lDTkGBL5it4stAU1blr7yF2C1XDx+8qgBKhG9NbbemeZyRSCj2nYmdQwc
         bIcTDKkw5XlZVxgpm2AyxCTviRkJ34c7JCIP9UljNPX/3yG9tJNt9lGBX8CkEB7ib/5b
         FjZYOuNSJnnAhEYwT1mzIYPZA7nIc7+K140cgo+OQCzEYRGpJ2IZ98tYmBmTABPKBdNk
         lejddSHnm4LBAGQHgYKUe+M8DmaqpPWdoe1uoV8qo1ZG1fEnN0DL7qB9to5X0rgIL2FR
         RjwohsDjMeiv+J8ZP9WZAocv7wUn/mLOlI3VuKHgBw8RT9wIy9eAv3fptR64RFggaVA+
         rxIg==
X-Forwarded-Encrypted: i=1; AFNElJ/Qa+Cjuz+S65M3agQ8DxWUxmsfslp0FALA/HxbAowlDBfP1DT1Ihcs7pWP4hkjXp+1tgxJ6iRxnWXCx3Ov@vger.kernel.org
X-Gm-Message-State: AOJu0YwNVx1SUY3derWynMrxf8jZ7QFuQj61NOrdZtlnzHl48s0kAcJa
	/pB1f0sWMQUsavV2kzVg2j/QGIbpVPwhyS9GgDNcl/fO7fOPfcQ03lg1HGivfaRimaQ1AR+v/XQ
	C0QLkbQWIgscCiHzG+iN7lVAb+/RY0qFRZocJdYw+6WVjhzkBCCcOB7OpMswT0ncPA8iN
X-Gm-Gg: AeBDievGVJa2cpqbz8lhtNPyEP6RJm6x/gUl6ofx5NVSp3Fe5NPr25sOoYxNWqdRuwX
	efDMIn7mwSVxY2ore2NAyc+ak/To0ImxEWdJZElglx1gkoZWNrL9R3fHugo4wWvQrJkIqljpzf/
	m91LnslcKTP2afD+3UE/PMrqJq4LNSeY837QnqRRlyZsDAMrgEA5s7QNviFNRCOrsKekg+1Sutz
	vXsCXRC8JT5m3Xo1wbmkGSf20LhQl11Esi9pjUc7Z7yW7qiY0rBWhug3hGa3ydmoUTaAffwezZE
	e6p/98Fd/oMOnjtZ5w8/gm5SRRUtt6a3MEo8oSugeBXHhFPEx+tVpw8Mj1ofknvbc9tqMW1S55b
	SxY0bOrS8I6S8NdIo3k2i9hzeXBcW156w2K3UyjcPF4X8pTIBkowOo+vG//3UhTqtBh5jK0Hia2
	vww5DJqDbldh4S8kHFWa5fD4//8ftKF9+rGq5h0AP3QJVlgQ==
X-Received: by 2002:a05:622a:4686:b0:50d:8bf2:45cd with SMTP id d75a77b69052e-50dd5baa925mr183936451cf.34.1776190443048;
        Tue, 14 Apr 2026 11:14:03 -0700 (PDT)
X-Received: by 2002:a05:622a:4686:b0:50d:8bf2:45cd with SMTP id d75a77b69052e-50dd5baa925mr183936021cf.34.1776190442538;
        Tue, 14 Apr 2026 11:14:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee1201sm3368568e87.54.2026.04.14.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:14:01 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:13:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, linux-arm-msm@vger.kernel.org,
        Xilin Wu <sophon@radxa.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <gyro53vff5xi6iwsk2vukf7ayfefrv5fpubz6gnkszxa57gfsp@ooqxoryikvxw>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <DD8RLVPWQQ7O.1B3E1P6VNMWV1@fairphone.com>
 <DHSSUO5USR6B.1767MF8GNTUEL@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHSSUO5USR6B.1767MF8GNTUEL@fairphone.com>
X-Proofpoint-ORIG-GUID: Yt-H-b4kvvGP5ZRzKOYSnC53sHgm2scQ
X-Proofpoint-GUID: Yt-H-b4kvvGP5ZRzKOYSnC53sHgm2scQ
X-Authority-Analysis: v=2.4 cv=HpNG3UTS c=1 sm=1 tr=0 ts=69de83ec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0qvo2eI3NjoiYXvQkeMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE3MCBTYWx0ZWRfX+lulX5u3KPXT
 +HteM6/YFOaGAJX0OSCbleZ+05iJJ5hO4DOF1cgEm8PJPKL9tSuUDMdGsIwviHRPjgRGQBuyTdJ
 +jhUyY1lqU2AiuPEoHtzmf+JZPCmuUwoNDxF5FhvP8VUtZ+FdlBJphH16Xa5KKQ9eLwLWI//eeu
 KtuSqPfRi9fnyEpd1Oeg/uq4StrjISDiTkndpFSW9nz6QxxHZAEdV5PIT5QmV/EeIqOIwdA0uZG
 ded1oYhaHPLl5n9arO1UvaTVdSWJodLT/A1k0QYQVAplkkGkev1uDTiUQ2kPFZR4DhFmRQvKgFQ
 60LICdfk7EkmjZlAYgAlCiKnYCibHAsNbpfDvRjjId8fJxEvyIPdOBtr0nd1OJD1QZeqg2F0Jvp
 iM8C5ximtFmolcz0xRxrcQjsKeq4rO3yJ0/Ryy1gE08JRNp4xC3LCyl0/en7yUxhx58lbrOX/E5
 uMiHlVlt7ro1Wb7HurA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140170
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103209-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,radxa.com,quicinc.com,kernel.org,linux.intel.com,ffwll.ch,suse.de,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,0.0.0.1:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D15BE3FD89C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 12:18:36PM +0200, Luca Weiss wrote:
> Hi all,
> 
> On Fri Oct 3, 2025 at 4:42 PM CEST, Luca Weiss wrote:
> > Hi Jianfeng Liu,
> >
> > On Thu Sep 25, 2025 at 6:05 AM CEST, Jianfeng Liu wrote:
> >> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >> use msm_dp_audio_prepare instead. While userspace is still calling
> >> hw_params to do audio initialization, and we get the following errors:
> >>
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> >>
> >> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >> hdmi-codec driver can work with userspace alsa.
> >
> > This also fixes DP audio regression on qcm6490-fairphone-fp5 (using
> > Elite audio architecture)
> >
> > [  133.986865] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 failed -110
> > [  133.986878] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: fail to start AFE port 68
> > [  133.986881] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: ASoC error (-110): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> > [  134.045112] qcom-q6afe aprsvc:service:4:4: cmd = 0x100e5 returned error = 0x9
> > [  134.045192] qcom-q6afe aprsvc:service:4:4: DSP returned error[9]
> > [  134.045214] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 failed -22
> > [  134.045231] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: fail to start AFE port 68
> > [  134.045243] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >
> > Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5
> >
> > And I guess, even though I reported it after this patch was sent:
> >
> > Closes: https://lore.kernel.org/linux-arm-msm/DD8PK8AI24P7.YK0OGVYC0QFM@fairphone.com/
> 
> Is there any progress on resolving this issue? I'm still carrying this
> patch in my tree.
> 
> Shall I send a revert of "drm/msm/dp: reuse generic HDMI codec
> implementation" to at least temporarily get this working again until a
> more proper fix can be made?

My understanding was that it should be fixed by the following patch:

https://lore.kernel.org/all/20260402081118.348071-12-srinivas.kandagatla@oss.qualcomm.com/

> 
> Regards
> Luca

-- 
With best wishes
Dmitry

