Return-Path: <linux-arm-msm+bounces-90746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFSOGG2meGnVrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:50:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B89FA93E11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68FF43072D96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E205634B190;
	Tue, 27 Jan 2026 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+Mx0Mw8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLKDb49d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994FE34A78F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514394; cv=none; b=SAQaAxrIzRVwyzfCJ2TH0Lk2glAOQ3XsOAYeGRSxEqAyOFdjyWIEhBgGZJn6gtASHbFJtw0aXfxWrQz4M4IvvUpLaCTcTMi74XvBOMay9wzgBG8g1/8Qd8FSUT3WIXqJapUR5OX6rOb37PRW8Qp/RlOA7VpyvSnum1HnDF9uADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514394; c=relaxed/simple;
	bh=VlmTMLAt9e4AQFaBolkFJ6JtVOVwnWYSxH9m1xGbwAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6ptiT97Qb51nSTLYedI6XaQKJk8MPFRD7agsCgjG6YWVfuHvDG+edbqSmzP48yC+P/4tiZppxntak30T+rbmCd+2zelR1CuvlirjmNAlIhkbkPorUMuyDjQCzLwhSDCLCf2ceBgzflJcfoSEo3aKlvMHceRqCo4bQRy7+3sUL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+Mx0Mw8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLKDb49d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAOJU63714671
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MLtuoc2Wd0WuVPEXaciWpMVg
	21wsMqAZRvFbNmrGRnQ=; b=e+Mx0Mw8732J/82KQSPd77PlMhXxv6LteNKSLKCZ
	EPN+hKnhzRqr11bZMm7/aqoVvLBoLlWtHRtBSAXPujK6GcwQFqwpq8lWFfnGIKBv
	Om+P77mSkVxHJCuYaGIbc2tFmWO2W9LPA7dPWjP5LW+PU/fDYLwrd1klMH9EjcqH
	MprOVi9m9Ahk/uxUFmZSFcqE7mZkoNukeAExj+WGWbz/DHDcqxMOJwE7myQA68BE
	IGBIk1Uyuz2+4/aRT8iPjHmgiacADzB7AtHbG3Towqskz2jdDYeu56+kmHV+Lb3f
	Gkd+LQ3BX1hRZMsmwMQ1hwvboNuTrBtzm9c7rDjx2adbsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0aunp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:46:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ed6c849so34208885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514392; x=1770119192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLtuoc2Wd0WuVPEXaciWpMVg21wsMqAZRvFbNmrGRnQ=;
        b=VLKDb49deXeUUeCbkJngFB/VPSnIFxD3nOEWmfDtiODp2jtEzCnaAJE29Lz287qAiV
         MMRH1TryY7hRgVic+3pXxtsFWiyfrqB58DsYpY7PbxJo0TRKQZnAXCc1hdfBNe09KYRw
         Vont7pGcRcue6sgAWgBzH6+sSC3wr3q61m4qadLtVJtna8OkhZHqMhKP/u/49BQppaoT
         9Y+24HxOT+jOPmryuEbLiHM8aJTDAYAVW+FncOmRBLnjVWWwoxFe+S8A5bCfc4Y1XSfi
         Ujv4p+jlLIGMLy1Scs9YI6vyHwuxANTxKrs3kPPus0m20+WH/+0xiZKr58EczFs6dj3y
         JYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514392; x=1770119192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLtuoc2Wd0WuVPEXaciWpMVg21wsMqAZRvFbNmrGRnQ=;
        b=Opr5nP9y5sdiU8ph7F3mj1k0NlYzNHQ8YbNY9Dp648GeL4TnskHMMoEcmuGEqTVh6j
         e9hDWj1MoRTfulSp0AEAUtR+sLFMkDoXNi/wVbsCa0wHk1Tl7kE+A6bEJndr1cgb9bbT
         pWbvAiwecGr6gdIGQUE6oUDmJwGdukAdw59/21AGIyYz37VQH6z1VHknNRIom5c4FXQh
         0FF9Uk7GUtHjMGrZ8Wb4ilyiSBpHxoCdDohcHrqQfeIohmx77AGa9PxA4oK6CXrGwT5o
         MxhYgjsFT5z4gs2KTX8nVzkmJIg2KVTVnCK29ypTabRwBYidXjVSPDmq+DeyOFWLoI0D
         3WEA==
X-Forwarded-Encrypted: i=1; AJvYcCUKZmG8bqx73rt+v4FZ6eLCtSnZizbxP3yDDldkhxMCP+FowQlps1Y5zCapJRcKC0XvGQd+gPXsAdzetcY6@vger.kernel.org
X-Gm-Message-State: AOJu0YyUBd26BI0SAPFfEqiR2CFufq5Ns11mWVc3/TA1UA0eyz8KKdCb
	8sGE4iUD2Fl+iS1YkQebBZ7B5PqDE9xsPP9949Nm0pD2CB5UOqc8TVW3IciEIIxChVnTM5ENSVo
	F+kleoy0Dtrvs8/7RyHm3RvY1KPfmYHny6Tlxd2OG+4HNciq6oY3vymAV7yScZFwhRHbm
X-Gm-Gg: AZuq6aLZFKuFwQYgUUg6Q68HPZufyMS9CLJ+rTrZSYU0ncNuLeBGVwqYtKh9Fy6rkWL
	KQzkug5N8R98OPZYN8Qsv4r8otxm3Nu99aYXd58HWAFbKPhMZ0+TLepwMoQbhO68mLq7huMGlhF
	+FpxdAViG8GVWTvfqfLALf6WO2Aktt2UN8Hc65B8GCuybnX2zsoFVOmCSotk/5099UNMeh+2k0v
	zmtjhemlI3eJlSfPnfPA2gsHS7fMW7xzUjyq1WWp6ZYkL0kxAD5DKcponw6w6/I+pC4bDafvePQ
	OGde5uCIN+eni6JHzcBscy3T/HViNgieeWPW2oVD0ByQfhmmjXf/kFKl8gWex+Dce81tFlUWtCH
	lTcSgKrSvcItXCETwX7JmxtdB
X-Received: by 2002:a05:620a:1a95:b0:8c5:310d:3b2d with SMTP id af79cd13be357-8c70b874091mr156259585a.33.1769514391661;
        Tue, 27 Jan 2026 03:46:31 -0800 (PST)
X-Received: by 2002:a05:620a:1a95:b0:8c5:310d:3b2d with SMTP id af79cd13be357-8c70b874091mr156253985a.33.1769514391021;
        Tue, 27 Jan 2026 03:46:31 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm36091323f8f.17.2026.01.27.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:46:30 -0800 (PST)
Date: Tue, 27 Jan 2026 13:46:28 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix LM size on a number of platforms
Message-ID: <h37gfvfbla2uk6sxzh6zhi5uotqhjarsqqrubhx2odpwwxmwb3@iagedhb4kgu3>
References: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
X-Proofpoint-GUID: YaEQ16SR4W_R41GvNyJqaCPucF1UxDxK
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=6978a598 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LCUY55zAO45cASmWvjAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: YaEQ16SR4W_R41GvNyJqaCPucF1UxDxK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfXxdeaameieVtW
 ovcr2boSAoGb7j4vR2GfcZJGDQzCkS9iG1FYgfEW7BeAvHuuq5F9xClrMcpd1b7NVEk9mivi/qA
 POAb1HobveYMZwKANz7dLVYIaWjKRUpYkAJxJYIY7+GBbmCGbcvtXx2LkVWOV3jA+PuLyuLce6/
 RA4WZQLAlXPzwfmUVzF1eMGEVYrziNAQnFVM2h11s/4v1EH+QtyeNllEPsTo+ZVSddmg0X/rAqh
 mefANPe5pJzBgaQGTZ3j9AmrqyoLmr6dLT54yULRzjTYL16g2PgetBisM8b6Nu8cOZZegWqckUD
 dkXA3lG67e1WKOArI85ekYI0CWeNINDEg69sQubzOD6dzfDUzWBpCeLsmVMEETA2TYb2a7oPYq0
 j75WHQ2lzMj78tKc+Bw8cpwhV21sHRxHMgFLgtsbRKKyc7D6o0zhAxsKtofGdKHYFwRal2feMeO
 +x85wkvJR8pQ+GyUULw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90746-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B89FA93E11
X-Rspamd-Action: no action

On 26-01-27 11:58:49, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The register space has grown with what seems to be DPU8.
> Bump up the .len to match.
> 
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Quite straightforward, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

