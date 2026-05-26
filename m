Return-Path: <linux-arm-msm+bounces-109744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OMCDJtQFWpMUQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:49:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136A5D1E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 788963007AF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE7C3CC7FD;
	Tue, 26 May 2026 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAJTOSRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WKcGamHN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6D1372EE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781768; cv=none; b=pQg/DjYWHfBTv7/ca3DJbHV7soUKlBbgzrVkhE1+cb6IUitfkOWRWdyfvhtw84BYm27DAI6j/IaMcyvjdM35yya1k4iLaLxgQkjxerI9jM67X4UrpQi8VIbNRNNDNDOxY9iQVVqk1vOEqPaV8BqRg59USHAjHALCRPigjsik5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781768; c=relaxed/simple;
	bh=No1oh+rmv1z3bYYPB+KNnQtY9bbVZc8ZtbTEvf6fM3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qxfvw9zI11ySwhupQm0YKD7qWNNWSqayGRxjMz68a8BAlwWRQ2zTYmiwuomQ3C5LFL7cAYBpQrMYWXX9wH5GU1kLsCufpqsY+p1plz9rXcNxkG2iEs8nfNFJodnsaJ7vP8oNFxu7S4qVhlYzOuVn4y5pPhFbPwssWF56aQqeZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAJTOSRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WKcGamHN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q60jbZ1763741
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkGK7wR4FNAd/aZaMAvHPLbzZ1eWQf9nBfPf5NjaC8U=; b=NAJTOSRqxHsP2w6I
	dQx6zh4bh+Nax2bycBu4QM3DFfmOyFASk1vpM9FBdOBAGY7/y363n+G5klkwv67I
	/KAIQY4Ui6ouZ8GnlWIBJIaJ6YqFz7+FyGqtnqXLBBKet/cSxGgbC2ssKTGWxTzr
	ZdinhZ707nQRG2YA5aaEYcUSVO2RhIDoT+QEsRjp3pDqeWDLFxSmlJO2muAOD78Y
	Si2AEfJXzWScQlpjJcHfohlg239MsT+EaBUU4zIxoSsfHK72urgbRZ/afEQjZ9Xf
	pCkrYCdUkZFwK3zZzGbIgN+//dTROBkTVTtGjF+N0oCPEfvQ66XLDirqw8Yynjk4
	2mTpjg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vggcsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:49:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so9376244a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779781765; x=1780386565; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkGK7wR4FNAd/aZaMAvHPLbzZ1eWQf9nBfPf5NjaC8U=;
        b=WKcGamHNpWiMQgl/iVgbT53l/Ufy4CLnYFrVTzcANaIX8GZllxfcbsGkCX+TxxWi6J
         7Brm6y8uqTPpiaOo1jwRbk6ry8jSvrA9bCWSxsn/wOHg99jucjp5ToEU+V7FH+hpx4au
         X2USht1WnKniche/b0YjJJkPvXrmUZyIKW6M8oy8pO0BKLPm4hspyohC543PRIz45eVA
         9IoW9L4t0WbxKeBIvdmTpfes/XhOsOoDD4gGT6fhlzQdiPyVC98oTBN/cHAOH8UWr02Q
         k4bvTrfMKWUMNxRClv4Z6/RhP68ifqjz5LaLvawb62YNqeo3KpENA81Ge+6mIsiC376s
         FfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781765; x=1780386565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkGK7wR4FNAd/aZaMAvHPLbzZ1eWQf9nBfPf5NjaC8U=;
        b=bVGhkXLOvy9IxKDf4z4gO929oXdrRFnAuqEFHFI8NYhonrju7Rc8NfVSWiOUxdbiez
         kFrbmK7VenejOG3wcWjZctr//ix+QQHFAyV69EJIgH2FVqA4D5awGYllO8pDeYkL/W2L
         eXbEDcW/CF/zE0aaHj67HwrN+43/wIt8Y3xZeB0v+A+A8x6/Suqo+gESJJAzwwHnC0s6
         kLoEZUXd3aQre1OADDAPKMW0epY3VTrZFtOgv2OGGb3WxBYKKdA15wrMBoICcF2ZnTDj
         mD0Tk0+5q6o5l1QK/y1p0jEBGzXK3pQn+ZAxKf0N8C7nATQUUBasAZSWOtuwquW60wFL
         ejvA==
X-Forwarded-Encrypted: i=1; AFNElJ8q9gCRZuigx7HzhdMNZ09sXsAp3WlcFe6d03S+xv8BnV26M9n6uQUMDw/VgBR4L8KNZWuqgPKfLuGIJlT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1RSvIDET7uWv6g86I9S40ms961XiicicuHsVb1lFkdiArnkUZ
	rTupdOwNd6YiBjDnfGrSRTropP8u3x2roaF5KGbdJXE95eCwdYsTTv7AGj5SgDvShpcox6WR+Li
	eQH3Wa6XNehn6pyenxHH8kYA1bNeYH457gszibHzecN2kNsaPaGsiFKXa6kXDegMOleht
X-Gm-Gg: Acq92OHG5JhQW6F4owyNmkk+AD3thPMskBXgZw2nBzFs/CV63wlFCi/CMcYHoZa+9v7
	lCmEVJjpNRE+ETmLh2SRu9mwM/8k4FBth9Jo3WVhRKR8hglTOQLVjbUomlxI0jynYuKynWZ+6e3
	cyv6IolazFY56gsAPYQn/JFhSPq0jVg6cgZDR7L7sT/I8qC1XkQFoAaAViBMYmrSOJdnER9gkh4
	ID8LbdCMlIceJXnqMxVzbn1op2EeQupfx4zqvWZzzJmEXped3n/8bBJLWTpk1Tg87nBia1LqdZu
	LKbel4mS4PktUUH1N5W1tDIoDNwDYKbgnA0jrmQGa0q5Vrwiy9pEsyD8L4YDaAYAB3dVfK/tOkE
	WQJ0I8YdRMio5iBPY/C1M99E5r/yW/2hwDXUi4cbacgsQylMp
X-Received: by 2002:a17:90b:2f83:b0:369:e4d4:7460 with SMTP id 98e67ed59e1d1-36a6784d120mr17603253a91.21.1779781764548;
        Tue, 26 May 2026 00:49:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2f83:b0:369:e4d4:7460 with SMTP id 98e67ed59e1d1-36a6784d120mr17603227a91.21.1779781763923;
        Tue, 26 May 2026 00:49:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721282e7sm11574492a91.0.2026.05.26.00.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:49:23 -0700 (PDT)
Date: Tue, 26 May 2026 13:19:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/5] remoteproc: Move resource table data structure to
 its own header
Message-ID: <20260526074918.weio2reytcnuziax@hu-mojha-hyd.qualcomm.com>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
 <20260506050107.1985033-2-mukesh.ojha@oss.qualcomm.com>
 <ahRwlftSboEC2Xw2@p14s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahRwlftSboEC2Xw2@p14s>
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a155085 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LaNNHw_vc2Zlpho5bK0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2BwlCiNte6qUaT_AlgTYijFIx0BysZfL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2NyBTYWx0ZWRfXxfz5mN3Q3BUk
 tlbH4ox5UzrxUwcRHBcg/ENisfOv4YmB8TzY6wAqe539gzjmJKRI+Hu2qvSfJJkifBFtXShKBrc
 Em9dchaz7/wOY4LezsrSjuoC6WfGFbpEA6yuuSbhHOhhrkfueaHxX34KpNSI+GejfNAkZV5sffW
 xO6ZT2nfVpI1SGNUaYZscwcoevKPHpuimIs3QFiX/wqEuIDTAwNo2NJyqeGGiVCKTJHUEBksSwx
 dzPDDQxD3x95tOPj2JBNoCNDe0Y7hm2DSUiIBqvmsqySJnzUieOZrAEvXQyhqyrC5FmIDPlJbOM
 Nb2hP3QHSktap3D10m4w6nzn07BMD8M1cBPysUN+o6VYO2y6ubfhMMTUz0mTuloqkmGvWu0ZbbP
 4PPXlosykcz3AvOnEHPbTBadLLBwnGk2RdRGZDB5nWiVIvfEkO1fuldHLyKFa0h5V9MnF27z6fP
 BCXEknD0OFirBRN8GXA==
X-Proofpoint-GUID: 2BwlCiNte6qUaT_AlgTYijFIx0BysZfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109744-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,checkpatch.pl:url,linaro.org:email,oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3136A5D1E8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 09:53:57AM -0600, Mathieu Poirier wrote:
> On Wed, May 06, 2026 at 10:31:03AM +0530, Mukesh Ojha wrote:
> > The resource table data structure has traditionally been associated with
> > the remoteproc framework, where the resource table is included as a
> > section within the remote processor firmware binary. However, it is also
> > possible to obtain the resource table through other means—such as from a
> > reserved memory region populated by the boot firmware, statically
> > maintained driver data, or via a secure SMC call—when it is not embedded
> > in the firmware.
> > 
> > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > etc.) in the upstream kernel that do not use the remoteproc framework to
> > manage their lifecycle for various reasons.
> > 
> > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > also want to use the resource table SMC call to retrieve and map
> > resources before they are used by the remote processor.
> > 
> > In such cases, the resource table data structure is no longer tightly
> > coupled with the remoteproc headers. Client drivers that do not use the
> > remoteproc framework should still be able to parse the resource table
> > obtained through alternative means. Therefore, there is a need to
> > decouple the resource table definitions from the remoteproc headers.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  include/linux/remoteproc.h | 269 +-------------------------------
> >  include/linux/rsc_table.h  | 306 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 307 insertions(+), 268 deletions(-)
> >  create mode 100644 include/linux/rsc_table.h
> >
> 
> This patch is giving me a checkpatch.pl warning, related to a missing SPDX
> header.  With that addressed:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>  

Sure, will take care of it.

-Mukesh

