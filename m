Return-Path: <linux-arm-msm+bounces-94362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AjtEZERoWlwqAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:37:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8432E1B24DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C6D530B389F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 03:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7517331A68;
	Fri, 27 Feb 2026 03:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtgaSaDz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwW4iu9V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608103314CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772163470; cv=none; b=Q6qlYtFv47u1ZbqaiDHy8GepFPWuShljikznJPDAgPLcRGcVBx7D6DOBoWSVY4l0KoRIz7ABhoyRsogTORUuY8UniLRtLOITiJyVfN5ql0BczyLE99phaWHf0PFs+J+g4tAPX5AdLzlBCQ2r+yV8Jlq5wUDhguaG1fO4Ql0WlPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772163470; c=relaxed/simple;
	bh=oggj4m898KPyCs6IX75DSQ0u9pb5aLUQtEYti0nCh6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sw6+aPUSrNtV+uoa6EC6dl/p55ToozOCtBiBpHEMJBOF0ku8tnvDJS75YnwlwfBqEF+Hozwh4AlUMQ3lW0nU1BxXG6zJBVgqN1zbDlZnGEs53tHD6elqxj+OHpHwmhlwQ2cQsuVDCcj1O1wPdgOY9y822Dei1/Om4KMKqPRF4vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtgaSaDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwW4iu9V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JwNZ2413821
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DYfpyHdyNliHmcdKTDNlDNAZ
	DoeBzGtHN4rbDOCoQWU=; b=AtgaSaDzPeBrWb606AtzQUNVgokvGyQ9Pmeoq233
	bDPrhHI+JWerYpAEqUr81cT3bzja9u7+1yc7RWQQdPpmsH4Mgwc2bw/RT/IO4tYq
	gtWE5qQ8HjxRDWN/drmy4NOESbX/xxQiEijH1edd+IWsfekJeEyKKPk5egZLmxDd
	0pYYSdzojDmyhlDKI0Ka3KwkpAQrBbpSJIxxBIBp4ol+0uNn0gZ7+88Z1SUHPPq3
	b10EAtU3IHbT8kNX7zqFJP0avrtMDmi2C1zK4I4WLgWuz61lTnlhvHRCDufgT0ut
	YfUe0gS16giEgQdohBtUQeJigm5UPeDiEiMBrod8cDLCAA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0gcu85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:37:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50335bd75bdso160162851cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 19:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772163467; x=1772768267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DYfpyHdyNliHmcdKTDNlDNAZDoeBzGtHN4rbDOCoQWU=;
        b=OwW4iu9VOgxhKBb5W5lobCmeg4n1j5saeKtql2P05F4v/pRCK7W2QY+SQWqG+sm7rp
         826Q3HOFiQJXfG0LF7Zv2xPlS+2E3WAB3pFbZ3b++C3hiby73PN7BHVJzYgf0srPKt6p
         5s1H3DeRJxw52ht6KC4Zb8RcarpaNU19Bo4xvm3VRpr8lbt1EeGex6U4BkIugDPYSEq0
         NPE9b/aVe4vVGL72cOHcTBYhe8ORzTRaVxdGlYGT2m2VZKV+YYpVILowb+lbiP8MfVEz
         s/cdefQyTc6ce6+/ivODLGqvY4C7mnMIe7f3iWyLj8fJIrKdlTzYWkcO42/iwaCpU7iY
         YlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772163467; x=1772768267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYfpyHdyNliHmcdKTDNlDNAZDoeBzGtHN4rbDOCoQWU=;
        b=LQBZBcmLW8RL9fjGsP1DeXGTA44IiiCFyAYT2qjchPN3d/PkWgiyPgwqypcwy+0rvv
         pV100mUGh0igcN4zKKVNzL3FZcWsXHlaF68ZRi/Bb7ZkKpHLVxgzxmiVjFCosuCtYfIJ
         CEzzIipmOeG2LS97i5NJkkwkQOKo2MFZOZP/GLtI39VBNR5fMmB9ON/DkjLW0NStGb/e
         V1iReoiKcZWVjFsA4Mvhrz0ADi6tn8OD+Ah2c7ZpMzlOHr7BAcRot1/XKNgEO0E+QOb7
         UR2+9i2dYPr8gSO/5FpHWpxLkPWOXk/oKK3K9bjsZOMhljAa/7HEqX2PCPsCdavjOl1G
         3Mbw==
X-Forwarded-Encrypted: i=1; AJvYcCXsek/uogojMTEzRbVCdSCvr2ea6Tyz0xNpgE96YusTEx2bHbD2QAcep/3Q41keC9i4RUkZC++rZPkKzQ9x@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn1ncKfh7MuUQgrZ3ukMmAiQ4Ll2LW6mZdLTHiQIRaWuIZjxKg
	mbMMFpsEI/0Fe6/mJdrOWZI40R5a1II1C+N2wvEqhZ3LAapSAfP1xnjHRU/sopnY3XG3Ad+lQwT
	jeabCQ3qBvehIWs2o7BGlP+SMIwOmwuAkreCfgcdFxQ8zSMkm16XZRb2FdIWd9HXG1rPd
X-Gm-Gg: ATEYQzwwQfuZqciXaQHqT7FPsdl2hZkrIj81rUx1ya3f+pR43TROHTK8p3raVxqsNb4
	dJE7PPnurM1jWyG62WPmY8dw3TTwGtHBT65kxX6z5P7FYHeFzpFYIIrCbSJpEdpI0v7QBAaIhjZ
	8u2EkUx7JmtsZ8QDdpIpRJwFeI0bLpm0+XyTw/xwGmwuJbmNAN1ap9fZjg5TGhfhGhNgJhA/B3Q
	32mpXtIiMstJUheI19YhCuH/Bn6+b0rQWJPrHlmWh07Du0sfLWRDHPJT6+rOYe352r5HzxNkCBF
	tGzhYT23IPLU3L1ClkbWJT93uhOXvwpvSvStmFxsUpVkzn13LUAvhXoQW/3EKJH03DDMep7OWpS
	3oyUAosshLJO7YZ1qYBOLSxNopZvppyQHuInn2SDMOuOQlkxNo8yvw2bmTg5HmNhsfBsFDqq11l
	1suFDGl84=
X-Received: by 2002:a05:620a:1a21:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cbc8df1ddcmr161576685a.41.1772163467144;
        Thu, 26 Feb 2026 19:37:47 -0800 (PST)
X-Received: by 2002:a05:620a:1a21:b0:8c6:a539:55cd with SMTP id af79cd13be357-8cbc8df1ddcmr161574685a.41.1772163466554;
        Thu, 26 Feb 2026 19:37:46 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf66b9d9sm375661885a.12.2026.02.26.19.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:37:45 -0800 (PST)
Date: Fri, 27 Feb 2026 11:37:37 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <aaERgXWdmX1MT2+l@yuanjiey.ap.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=69a1118c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VgLlj4axOkVC7TBc3uoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyNCBTYWx0ZWRfX0WleucoSrJza
 MmA3VhxKZp7q1gfcX7coI41qw4fqp9DMvnwYaymeWceIQqwnfGugjjKTI295HSqt4192dv88Ik5
 R3kvQxgOd05fQRvRuSlMmiyzxgR/WwEFH5gUucbjn8biUHAwOVyiKxdq9rcskb6KBipsn/WBePS
 YyPDv48OQaHpHUlwE/gURgqTCTu4O8VD7A1GZgY2UafR6eOoCt+qb99gfjmrmDRlg0gwfZvGrtl
 iJ4KcnP7WYNll485t2sycIZlarJGgAqwZ1FaSPdy3+fZtWC91Wq/q0a+waPNkAK/1o00TKFa9C4
 QR7ijld0ukLE6kUMLRLkqrIVqTUw5TEQh2Gp65C3MjGYUjYHdxVc+IGDOVNZ8T0xtfUjgI8KYvF
 Bs1UsYKuYFsIOvh7oWurf7cW6/sM/OuUBm/mcPSvfQ9nFRWpVLdGhmy2pzqdrgCB9XW+slGW+nr
 sm+kTOComerXfG3i0pg==
X-Proofpoint-ORIG-GUID: 0N08qlfASHy9MNKueTGQ6lshN0Dha9jR
X-Proofpoint-GUID: 0N08qlfASHy9MNKueTGQ6lshN0Dha9jR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-94362-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sc8280xp-crd:email,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8432E1B24DD
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
> On 1/12/26 9:25 AM, yuanjiey wrote:
> > On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> >> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >>>
> >>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> >>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>
> >>>>> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> >>>>> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> >>>>> original (highest) rate. When runtime resume re-enables the clock, this
> >>>>> may result in a mismatch between the rail voltage and the clock rate.
> >>>>>
> >>>>> For example, in the DPU bind path, the sequence could be:
> >>>>>   cpu0: dev_sync_state -> rpmhpd_sync_state
> >>>>>   cpu1:                                     dpu_kms_hw_init
> >>>>> timeline 0 ------------------------------------------------> t
> >>>>>
> >>>>> After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> >>>>> to stay at the highest level. During dpu_kms_hw_init, calling
> >>>>> dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> >>>>> fall to MIN_SVS while the core clock is still at its maximum frequency.
> >>>>
> >>>> Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), which
> >>>> doesn't do anything with clocks. I think we should have a call to
> >>>> clk_disable_unprepare() before that and clk_prepare_enable() in the
> >>>> resume path.
> >>>
> >>> I do check the backtrace on kaanapali:
> >>>
> >>> active_corner = 3 (MIN_SVS)
> >>> rpmhpd_aggregate_corner+0x168/0x1d0
> >>> rpmhpd_set_performance_state+0x84/0xd0
> >>> _genpd_set_performance_state+0x50/0x198
> >>> genpd_set_performance_state.isra.0+0xbc/0xdc
> >>> genpd_dev_pm_set_performance_state+0x60/0xc4
> >>> dev_pm_domain_set_performance_state+0x24/0x3c
> >>> _set_opp+0x370/0x584
> >>> dev_pm_opp_set_rate+0x258/0x2b4
> >>> dpu_runtime_suspend+0x50/0x11c [msm]
> >>> pm_generic_runtime_suspend+0x2c/0x44
> >>> genpd_runtime_suspend+0xac/0x2d0
> >>> __rpm_callback+0x48/0x19c
> >>> rpm_callback+0x74/0x80
> >>> rpm_suspend+0x108/0x588
> >>> rpm_idle+0xe8/0x190
> >>> __pm_runtime_idle+0x50/0x94
> >>> dpu_kms_hw_init+0x3a0/0x4a8
> >>>
> >>> dev_pm_opp_set_rate(dev, 0); just low power to MIN_SVS.
> >>> And freq MDP: 650MHz
> >>>
> >>>
> >>> And I try change the order:
> >>> from:
> >>>         dev_pm_opp_set_rate(dev, 0);
> >>>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >>> to:
> >>>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >>>         dev_pm_opp_set_rate(dev, 0);
> >>>
> >>> But the issue is still here.
> >>
> >> But which clock is still demanding higher MMCX voltage? All DPU clocks
> >> should be turned off at this point.
> > Yes, no DPU clock demand higher MMCX voltage here. But next time pm_runtime_get_sync
> > need higher MMCX voltagei due to high freq.
> >  
> >>>
> >>>
> >>>>> When the power is re-enabled, only the clock is enabled, leading to a
> >>>>> situation where the MMCX rail is at MIN_SVS but the core clock is at its
> >>>>> highest rate. In this state, the rail cannot sustain the clock rate,
> >>>>> which may cause instability or system crash.
> >>>>>
> >>>>> Fix this by setting the corresponding OPP corner during both power-on
> >>>>> and power-off sequences to ensure proper alignment of rail voltage and
> >>>>> clock frequency.
> >>>>>
> >>>>> Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> >>>>>
> >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>
> >>>> No empty lines between the tags. Also please cc stable.
> >>>
> >>> Sure, will fix.
> >>>
> >>>>> ---
> >>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
> >>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
> >>>>>  2 files changed, 15 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> index 0623f1dbed97..c31488335f2b 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
> >>>>>     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >>>>>     struct dev_pm_opp *opp;
> >>>>>     int ret = 0;
> >>>>> -   unsigned long max_freq = ULONG_MAX;
> >>>>> +   dpu_kms->max_freq = ULONG_MAX;
> >>>>> +   dpu_kms->min_freq = 0;
> >>>>>
> >>>>> -   opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> >>>>> +   opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> >>>>> +   if (!IS_ERR(opp))
> >>>>> +           dev_pm_opp_put(opp);
> >>>>> +
> >>>>> +   opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
> >>>>>     if (!IS_ERR(opp))
> >>>>>             dev_pm_opp_put(opp);
> >>>>>
> >>>>> @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
> >>>>>     struct msm_drm_private *priv = platform_get_drvdata(pdev);
> >>>>>     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >>>>>
> >>>>> -   /* Drop the performance state vote */
> >>>>> -   dev_pm_opp_set_rate(dev, 0);
> >>>>> +   /* adjust the performance state vote to low performance state */
> >>>>> +   dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
> >>>>
> >>>> Here min_freq is the minumum working frequency, which will keep it
> >>>> ticking at a high frequency.  I think we are supposed to turn it off
> >>>> (well, switch to XO). Would it be enough to swap these two lines
> >>>> instead?
> >>>
> >>> Yes, just clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks) to
> >>> disable clk is OK.
> >>> we can drop change here.
> >>>
> >>>>>     clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >>>>>
> >>>>>     for (i = 0; i < dpu_kms->num_paths; i++)
> >>>>> @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
> >>>>>     struct drm_device *ddev;
> >>>>>
> >>>>>     ddev = dpu_kms->dev;
> >>>>> +   /* adjust the performance state vote to high performance state */
> >>>>> +   if (dpu_kms->max_freq != ULONG_MAX)
> >>>>> +           dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
> >>>>
> >>>> This one should not be necessary, we should be setting the performance
> >>>> point while comitting the DRM state.
> >>>
> >>> No, issue is during dpu binding path. And in msm_drm_kms_init driver just
> >>> pm_runtime_resume_and_get enable power and pm_runtime_put_sync disable power.
> >>> But We do not set the appropriate OPP each time the power is enabled.
> >>> As a result, a situation may occur where the rail stays at MIN_SVS while the
> >>> MDP is running at a high frequency.
> >>
> >> Please move dev_pm_opp_set_rate() from dpu_kms_init() to dpu_kms_hw_init().
> > 
> > During dpu_kms_hw_init and msm_drm_kms_init and msm_drm_kms_post_init.
> > 
> > There are multiple places where pm_runtime_get_sync(pm_runtime_resume_and_get)and pm_runtime_put_sync are called.
> > And each time after pm_runtime_get_sync(pm_runtime_resume_and_get) will access register depond on MDP clk.
> > 
> > Do I need to add dev_pm_opp_set_rate after every pm_runtime_get_sync and pm_runtime_resume_and_get?
> 
> So I took another look at this thread and I think the correct resolution
> here would be to stop calling dev_pm_opp_set_rate(dev, 0) altogether if
> the clock is getting disabled, since the PM APIs seem to take care of
> removing the vote during runtime suspend:
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 61d7e65469b3..ddc6aeae8f55 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1462,7 +1462,7 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>         struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>  99
>         /* Drop the performance state vote */
> -       dev_pm_opp_set_rate(dev, 0);
> +       pr_err("!!!! SUSPENDING DPU\n");
>
drop dev_pm_opp_set_rate(dev, 0) is OK. Test it OK on Kaanapali.

And I do some test:
1.drop dev_pm_opp_set_rate(dev, 0),

2. when rpmhpd_sync_state runs before dpu_kms_hw_init initialization.
[   11.123830]  rpmhpd_sync_state+0x9c/0xec
 
When pm_runtime_put_sync is called: it can set corner to MIN_SVS.
[   11.546084]  rpmhpd_aggregate_corner+0x170/0x1d8
[   11.546086]  rpmhpd_set_performance_state+0xc4/0xec
[   11.546087]  _genpd_set_performance_state+0xd0/0x1ac
[   11.546089]  genpd_set_performance_state.isra.0+0xbc/0xdc
[   11.546091]  genpd_runtime_suspend+0x144/0x294
[   11.546093]  __rpm_callback+0x48/0x1d8
[   11.546095]  rpm_callback+0x74/0x80
[   11.546096]  rpm_suspend+0x10c/0x56c
[   11.546097]  rpm_idle+0x11c/0x1a8
[   11.546098]  __pm_runtime_idle+0x54/0x98
[   11.546099]  dpu_kms_hw_init+0x3c8/0x4ac [msm]
 
When pm_runtime_get_sync is called: it can set corner to correct corner(here is TURBO_SVS)
[   11.784091]  rpmhpd_aggregate_corner+0x170/0x1d8
[   11.784093]  rpmhpd_set_performance_state+0xc4/0xec
[   11.784093]  _genpd_set_performance_state+0x190/0x1ac
[   11.784096]  genpd_set_performance_state.isra.0+0xbc/0xdc
[   11.784098]  genpd_runtime_resume+0x228/0x288
[   11.784099]  __rpm_callback+0x48/0x1d8
[   11.784100]  rpm_callback+0x74/0x80
[   11.784101]  rpm_resume+0x480/0x6b8
[   11.784102]  __pm_runtime_resume+0x50/0x94
[   11.784103]  msm_drm_kms_init+0x1a4/0x340 [msm]

>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>  
>         for (i = 0; i < dpu_kms->num_paths; i++)
> 
> 
> [root@sc8280xp-crd ~]# XDG_RUNTIME_DIR=/run/user/1000 DISPLAY=:0 xset dpms force off
> [  163.099585] [drm:dpu_runtime_suspend:1465] !!!! SUSPENDING DPU
> [root@sc8280xp-crd ~]# grep ^ /sys/kernel/debug/pm_genpd/mmcx/*
> /sys/kernel/debug/pm_genpd/mmcx/active_time:159146 ms
> /sys/kernel/debug/pm_genpd/mmcx/current_state:off-0
> /sys/kernel/debug/pm_genpd/mmcx/devices:ad00000.clock-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:af00000.clock-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:ae01000.display-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:aea0000.displayport-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:ae90000.displayport-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:ae98000.displayport-controller
> /sys/kernel/debug/pm_genpd/mmcx/idle_states:State  Time(ms)       Usage      Rejected   Above      Below      S2idle
> /sys/kernel/debug/pm_genpd/mmcx/idle_states:S0     67845          3          0          0          0          0
> /sys/kernel/debug/pm_genpd/mmcx/idle_states_desc:State  Latency(us)  Residency(us)  Name
> /sys/kernel/debug/pm_genpd/mmcx/idle_states_desc:S0     0            0              N/A
> /sys/kernel/debug/pm_genpd/mmcx/perf_state:0
> /sys/kernel/debug/pm_genpd/mmcx/sub_domains:titan_top_gdsc
> /sys/kernel/debug/pm_genpd/mmcx/sub_domains:disp0_mdss_gdsc
> /sys/kernel/debug/pm_genpd/mmcx/sub_domains:disp0_mdss_int2_gdsc
> /sys/kernel/debug/pm_genpd/mmcx/total_idle_time:67846 ms
> 
> (and the correct vote comes back up as the DPU resumes)
> 
> At the same time, we *do* need to ensure the correct level is set *before*
> clk_prepare_enable and any set_rate operations (the latter is already done
> via dev_pm_opp_set_rate())
> 
> clk_prepare_enable() happens in:
> 	msm_mdss.c : msm_mdss_enable()
> 	dpu_kms.c : dpu_runtime_resume()
> 
> (they refer to two disjoint sets of clocks but both cases need the fix)
> 
> I think the easiest solution in the MDP case would be to set the clocks to
> the highest available OPP (lowest or *any* would work too, but going turbo
> seems like it's going to give us a stronger foundation for adopting
> cont_splash one day, avoiding potentially momentarily undervolting running
> hw) during probe and count on these votes being adjusted either through
> suspend (if unused) or to the actually needed frequency (via dpu_perf)

Agree it.

Thanks,
Yuanjue


> For MDSS, we're currently generally describing the MDSS_AHB clock, the
> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
> MDSS_AHB one seems to have 3 actually configurable performance points
> that neither we nor seemingly the downstream driver seem to really care
> about (i.e. both just treat it as on/off). If we need to scale it, we
> should add an OPP table, if we don't, we should at least add required-opps.
> 
> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
> targets supported by these may not even have OPP tables and are generally
> not super high priority for spending time on.. that can, I'd kick down the
> road unless someone really wants to step up
> 
> Konrad

