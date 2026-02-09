Return-Path: <linux-arm-msm+bounces-92287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APXNGd/XiWlUCQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:49:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1B310EFD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A4383019FC8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 12:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0D9234973;
	Mon,  9 Feb 2026 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3SBJLmr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5b+i+O8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A82623373D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770641277; cv=none; b=lhh/qaKR08HWOWraVhnWJcM7ycHJpxxLtXTNi2px7DOOzZIez7syRmyAHfQT4V5uJvtwlmNlSZd6M2ezDnI43eG59CcpSkX3U1+nWaLhTmZbVK/CywVw7AJ+g/bMHg5PHwRikXPXRRuz54pvLFJe+eZGhmln593q0ATJoNJ8h9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770641277; c=relaxed/simple;
	bh=tHNsq3nnugwYsyjdzCc42nKgjHTH7Cm7a99SycTh1g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k42IC3qt8EB3mQ1WG8+QcjdfoTQpDWYFUFIUoGJ1rSRn+lw284hFAICwQ38bbQP0DRqZiXCPM+y47g9bo3VlU2kE5VRGZ6pSvTKHGYnIBZjEVw9gV6uCyQuWgpw0VhL4pnQKIlofkf45ULxDUoT+dtBmSKChwqHqAMNaHu7jxIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3SBJLmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5b+i+O8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Akndx3699967
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 12:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zv1IhHfbQzLncggLWBYHZWb7CtKh4XFfNBzhhyfYp1s=; b=j3SBJLmr7P6rfDuc
	TlVIGd1ns23MD2JU5ge7KZs+1DewX4rveHgeCSkTdd9aTc+rR9EYDDifU30euOPc
	jk2HCr7xo25Ws+iBO5VCSwBtEqO86YO8xqSrXCGV5dIkOek0d0hAV+05N/SX+Up9
	rsa+PdTfqX6V7Fd2OPlK9P3HlA5T2Y/25RHV4C03wxEeda8P2SL8QfcXpET7slKQ
	QFzSvriYlsv7odZUGHGWQmUsRUNakiOBqtlcjYVKb1MmdHOm+bIsecki9VNeNykw
	z9Cg9WsJwsVF6OYDxhiaaWD7e6vieLv9d5rbNkSDWJ/jWlttnW9ZYh7ykVInlh6G
	FjVeiQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4m8bth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 12:47:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ad709d8fso1034690585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770641275; x=1771246075; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zv1IhHfbQzLncggLWBYHZWb7CtKh4XFfNBzhhyfYp1s=;
        b=J5b+i+O8EddHP3Lg7EqeKd4dL5YjFpplROKrIk4YKBMWvdi70FGos5oKJphQzpA5i5
         //w0D3C8Bf96VTi/OW+uGe4maS+C4DLwa/UiB30atKmqOqFIHUL6XgwoUaKRlxzrakiS
         M3P2umB+OPFP11GfNm9LjIu0n70HRdBnqAcouZ79BEopHfy1/RleePO6BoKIILmy9LaT
         hm6/Ar+SPP1qiLvrDIAG2BW5k8vEMOEKyILAtTSBrYL4OzBU1a78O091mEHJNG2Cyy2d
         FTJkVUHo/xFFXzjUvDRL4KO7SKv3ulByPD0jyIca5EqwIZcIpPmbki7GHMOz+aQCXFIh
         LHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770641275; x=1771246075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zv1IhHfbQzLncggLWBYHZWb7CtKh4XFfNBzhhyfYp1s=;
        b=rmLbrxMr7ZKySqKDfNEhGdYaWGWO9OtITQ7XtY6rXVebOTsfOhN53OlueVb/j18YFe
         QpCVGnP2YMLShbO3AffPdfl+XQaYDW1ocvXBm9213n4TjNzEkheNJ2rL1tykDf3+aa44
         zxiL527CMWomhcqHigkSei0U//p53Wr5LgIxhbk/t8eW1hWq0vm7+4u6GRAyo7su0pkx
         BJjKld6pHtIIxFPYZQglEw9aatfiMCfkPe8oHopAFleq67jQK3mAvkJFr3MAX/WHnChv
         aPxCdBbfx/irDQe6NMa//LBkByx8SNcIOLB2D+fiwiVuVxNf/yViqrEXpcmkkyz++4XC
         bG5w==
X-Forwarded-Encrypted: i=1; AJvYcCUSIiNyZxYgIWpxzOt7GVIt/mLHr26eLnkW37cIrWP+TKDH35uKIZNA8h/uVXWn63KTmbdhnUCSfLW4wPDG@vger.kernel.org
X-Gm-Message-State: AOJu0YyE25g+CivFib0G7eT/kMIuisZAZoxbx1UIDvzJ71iGSkjcHs2y
	mq6OSy3inqJXVSPs7LZ/Q80ikr4mI4sT6HCMScewQMxG4Qd3Vk2wy2JlwiOIALFGXDK+ITT1O79
	LVsCUCLPb0n3jK4WDHRZ5whUvPZBMqppFO8ITNdkCjagurPUkGrsmto1rsSZuK/GfeneL
X-Gm-Gg: AZuq6aJK/noLIE/U/C78Pn+vHDnIrw2vmEGPJ4fzAoDPeVy8vVGYO4wMg6R/yiLhhD5
	NBjo10Nns7+Nqa7UM/ave/JTqMnAN+llNuZDZi7J8s3yYIg3peNk1GCSbJOELquOE3a2IQEwc+l
	l0qmztLpDExVB0lJRlO1iEroDBMTeXdd2TTzShdYo6wMpYBQtvvB19sxzpsCSEXL5Dg0bvtHuS8
	eIZ2dP/E1FEKgeqnfoZcmGq0Eru2SCRSCkWQRtqJaaL7cPFTdv2Qa6Xg5HXmZdirxcB5ycq2C/j
	F73/DGcSAm4LC0AVyBdX+tB2YUqZcr+YkknYIbwSw6ifLgYI7sjNHPM43vAMFOqFGKZiS0hyim1
	floPAXzCSaTnlC84wuD1J1PjNx55P7J6IDZkto2YaHmR4ct2/BOY0igkjWSc6cXItFqKlFIPFsi
	jID11fBQzSB/hYAVhA+tQLkuc=
X-Received: by 2002:a05:620a:2893:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8ca40b82dabmr1929216485a.10.1770641275532;
        Mon, 09 Feb 2026 04:47:55 -0800 (PST)
X-Received: by 2002:a05:620a:2893:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8ca40b82dabmr1929213485a.10.1770641275074;
        Mon, 09 Feb 2026 04:47:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e4d263402sm1466034e87.44.2026.02.09.04.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:47:54 -0800 (PST)
Date: Mon, 9 Feb 2026 14:47:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo
 PHY configuration values
Message-ID: <w3vmcgeh5bw7lfuyv7ziiw3oxpxtjyqmojddamjo5alz4nv7ld@ytgjwdhecfua>
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
 <57bwrceuqejzliljhrzj5wfumtr2q3dslgmjj3vd7masafi4k2@dskfnosor553>
 <23930db0-730e-4f99-a661-262b15f1a8ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23930db0-730e-4f99-a661-262b15f1a8ac@oss.qualcomm.com>
X-Proofpoint-GUID: ELLzLOPPwtU2xaK85bmr8ydxGJgbICa2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEwNiBTYWx0ZWRfX1Vup7Pj7qXpf
 o5K64NjBlBkLOqDmZtIsmrIZXzepSceh5BDaoqwOy+NXy6gBU1YBsZg4k7nZa0HAFzbip/Ce0ZY
 Jz8P7DYvQy7MwUsRHNUrmNk4lsUn5Riz52jgwYAggIfDGTs2aZdHZAZRdc6IQ2KtnBJaL64zVvo
 dTSggmuY7/6VQCPwVNOiVHplVLOu2HCpqdx7IOchZIALM3cxkca+Wwgv29PV905m4ZoJQxf4lsA
 Y8uVR39vNWByO7Hy9enfi0e2FlLJ4jZhoz597c29V78vmWPPfAqqo4Hrgz+x97sC66Rigcmanzn
 PDAGUiIxSg1Msh99HAGWHcTbFE9R7cqgsppKwWS8i5t2q9j9ezSJWKPN9WR3yQAhrOmFdo3RZZs
 PunKINzv7eUtl++eK61eQkOzbXh1VZ+EOe5uuaM4STALWsgphVyssuDTp9kMAaCs9NemPj8rhdc
 JCzEiOZV1Y05uDWaqGw==
X-Proofpoint-ORIG-GUID: ELLzLOPPwtU2xaK85bmr8ydxGJgbICa2
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=6989d77c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=XS_1FvVUK9dzS3CTT8oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92287-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF1B310EFD3
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:52:22PM +0800, Yongxing Mou wrote:
> 
> 
> On 2/7/2026 6:22 PM, Dmitry Baryshkov wrote:
> > On Thu, Feb 05, 2026 at 05:20:53PM +0800, Yongxing Mou wrote:
> > > According to the current HPG settings, most eDP/DP combo PHYs can reuse the
> > > same configuration values.
> > > DP mode：
> > > 	-sa8775p/sc7280/sc8280xp/x1e80100
> > > 	-glymur
> > > eDP mode(low vdiff):
> > > 	-glymur/sa8775p/sc8280xp/x1e80100
> > > 	-sc7280
> > > The current driver still keeps multiple versions of these tables and
> > > doesn't fully support every combo PHY mode. This patch removes the
> > 
> > See Documentation/process/submitting-patches.rst, "This patch".
> > 
> Sure. got it thanks, will remove "This patch".
> > > redundant configs and keeps only the sets we actually use, matching the
> > > platforms listed above.
> > 
> > Should it be combined with the 3rd patch? There you sort out all the
> > tables, it makes more sense to review all programming together.
> > 
> Hi, if this would help with your review work, I’m very happy to do it.
> My original intention was to do some cleanup in this patch—correct the table
> values so that more platforms can reuse the same table.

Fixed should come before cleanups (so that they can be backported to
stable kernels).

> From Konard’s comments, it seems that the HPG table may not be the most
> appropriate one either.
> Maybe shoud first determine what the correct table values should be.

Please follow the tables for each SKU separately (that's the 'fix'
part).

-- 
With best wishes
Dmitry

