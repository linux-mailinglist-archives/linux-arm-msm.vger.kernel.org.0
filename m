Return-Path: <linux-arm-msm+bounces-112691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XJ4iF8yFKmrPrgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:54:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2C67099C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:54:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HTXYhWGE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RfiwqYZP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112691-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112691-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA9513349239
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CBA3C4B79;
	Thu, 11 Jun 2026 09:49:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F54D3C4542
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:49:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171341; cv=none; b=QaYt2ZKybse7ypW+WNc/1vTR8eTlamyecmX4FptV4NJdfnGsty9gcKIWus9ApFcEJxh1JDjdUN8LEGmO6b0CZYx3Y61NK7N74AICg6NO3wEiIuO7QQ4YbovCcvFDA7lLPoSfPdxuYGUcbfL9pL1RL+QXH30MUn/n+JTpqND/GJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171341; c=relaxed/simple;
	bh=MnCyhCrwDlxMgkrlhfV4TtEa13o1YzAgTfd9QKqA/RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reOnOBExymSvs7w75834WHnmSj625D8EP70M5owzIahaenYhR9nCLs2qQD4YIz8dk4SGW40esonTfJK1KKPshrwfZhc2ZmDfz4wO/VEiTvh1gtM6gmS3VuS6QefhPG8R59j0gbait+MVPOA44RN27aVhX4IsIcKCGACFFaDkZE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTXYhWGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RfiwqYZP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GQ6L3817119
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Knhl1ddna0y+c4FljL/Lxt/
	HMyCo8T516/5MkE1l9I=; b=HTXYhWGELZhL6EGdTFiY6kPjdSwirLu9HgyPTmrs
	1U4qi4GjKUAwbRr9T4IZYp2pja6Ct+4Jvy9VTdwKMp4962mtaHYLWkuqmoAchmeV
	lU/PWww3BkhBgArI+IkxgVnGXhR5sJtOG8Ka4jLI8JHYw6kxxkyLoA47eb17qMEs
	BUKcpRHf6OH6q6GmS5/2TE2rqL01AVN4EGzJretpTwTUrkjw57vaBX5w3UILUmkp
	/NBVG9bWAZ7mUsszcuslcPrgNcgjEWpU8fEy14P4UMbkOwITXT/Khh9I2XmKAXX7
	zCbYWJSdUJRPxcIQq2+igmIWqjG3+uW+6vn+Nm+txDJJDw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6utryn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:48:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842688fa7b8so830693b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781171339; x=1781776139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Knhl1ddna0y+c4FljL/Lxt/HMyCo8T516/5MkE1l9I=;
        b=RfiwqYZPg9GSThRMq3IiUQZ4iO8Kun8N8MseeQQl+v5L6W6arM3y744b0kTFo9R2eZ
         9eWGfxMsKp75o2C5h5gAxfT8edsH41JJ8zGelI2+i9nYkMVhJsRS0MaHZa2Ka7VcB9BQ
         XFq11Mz/eQIXHCC5ccOZltYKOzm8jqJA4r/ZVec9AcGyWztgik7OX6I4skyWu84TQB3z
         v4Oaq4CmFttvfY/m0pLZm8jCow4uh87jeVEAbyM3wlLHOJ23ZZ+peNUA7suHs45O+Ot9
         zXopjSp1bpky/+bn7N8Jvd+uj9yPp9mW+ZWtskQ5UsCnnlbVu3+vWQLYito2t8B+83Ox
         uyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171339; x=1781776139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Knhl1ddna0y+c4FljL/Lxt/HMyCo8T516/5MkE1l9I=;
        b=IFOvhU1uGuqYT2h79TZff9a0tq2+3nLMGQI0+XRygC1Bzn22Mw8m+jb94tX2qieF3Z
         X41QlYWB8IdNJgT576I/crF/oBWpqemxdY+3iiYXCd4BCxm+lXAmHbUgL19wTqrcSokL
         b6Y6U3BnQ/NFuQyBovn+6ktcSsoeg+xAVJ6BegrzxNORC3hgCsXjPVcKb+aPyCajoQUi
         VXksabwdU5iRu3X+aaZx9pQvzDr63WIzQTN8IBUVEDJX9HRjPc05YxTzaZVbLVcAqjko
         YkZOudxHKUgMTUaCZflKvcRW16nPoSbwGcrK1tXPjqBGJdpJxRk+Yw4B0gt3OS3YZj3w
         88VQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MjqzGyMlVkLp0tXFxL+7KYmfUaI3Dxt70pjFMlU745mJxF36jBaLict5IG037xxnRbFNcqnWnrDUzcKi+@vger.kernel.org
X-Gm-Message-State: AOJu0YzR34Kks+tkV0xbxVaUY4D0WTuHi/082qAKZyY4vw9sAa3eQtE7
	+IkCyhIBnUds63zvbwcjN1SoFIAvKiY5SiNmmtE7iPZm282X1a//gd87vyvSPZNyYfceFCUziQ+
	+HlA3vqPfaWYhYDP/Lj5WMv8ys3TbMoSNXK3aw516oGHu5PT1q2Pm+p1n0In0Pu9IejRy
X-Gm-Gg: Acq92OGM2VaokYrtQcGVz2tlt8LrO8HUY2Ximu+PsBduSRQ0lEy/UjG4lt/QlrwXyJL
	JJaXnGCwJ4xvPV6iodd4PU3nL2DURYX4NkJPM43o2y0nEwM8yrPEriXV7lPI3sq/kdOxH1ReOF3
	379fSQKHHoKd5hTT3+ruauMNzJg9lMp2gIoXp/sQbXsOhZbi8oBhNyao1nRYGS7uoW3Tk/WDJlN
	u/UPiUEABL4CLPOyJ49W430rjbkbA/XkbMsXivIf5lUf8Y8N06MbHE1rmxa5ONEbCeOVYs/+uYO
	/De8HqNeqaPb391HBw/+f50nk42LnHyDArkYJTvw0ITtlJLM6xqMH8LqRsX/5wOO+f7Ih87BLl0
	//O3BLD8+GEmHZHIEXFIiYxOO5sQBZcpPog/6ZMMwTVy8LpJ4XOvcSg2Eb5M=
X-Received: by 2002:a05:6a00:32c7:b0:842:3804:590d with SMTP id d2e1a72fcca58-84335ca2a09mr1911949b3a.7.1781171338875;
        Thu, 11 Jun 2026 02:48:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:32c7:b0:842:3804:590d with SMTP id d2e1a72fcca58-84335ca2a09mr1911929b3a.7.1781171338292;
        Thu, 11 Jun 2026 02:48:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c9590sm1945195b3a.31.2026.06.11.02.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:48:57 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:18:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
 <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
 <aif8VS0pLYurFEho@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aif8VS0pLYurFEho@linaro.org>
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a848b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ot11TjGKcjkNMLPY8p0A:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5OCBTYWx0ZWRfX2TgSXf0fCqfd
 bDnxM9n6oXGxLxQlQwFKCeOXmcWrPZT5ldvxYIX86RcL9k0aakUNXke9uuo81zXNzO7DeRoSDOz
 qUtuuW9TzFM0dprtcYDe7xblcQN7dxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5OCBTYWx0ZWRfXw3DGALz+SENj
 fGb2zDJ8+KKnJGXPkNCnSh172Ydt7/+M2nLAmu9OqTlwm5OdcM3DaUeo/FdmXZcOGoYp9ZiJi0w
 AkEwabpI3mCwzWEkL2z+AjrkknKHUbNlqaWpqEv+vghx6IwnniVDxNcRjqSYxrLRNGY7qDRWwGo
 6MWUIrXGDatDMGyRZhMHeC5/g9uHav3LMV7DbkzupyKg10PgiDFIyomPjkCt2z8oNAssfly70u7
 tPghvr5S6ocdhKV5OIw0avNJLEDsMmtBwoqrzW70FkeZgcbWxj9Lq6ALq49MfQQHuxhZD4eoVT7
 NpwgqtS1JPcEPlgZP+CRKLGqA37oKW/swoQHpp9XAuB0Aic8fpZtXg1fnv1BlEMPZwqppbgh+m0
 X9R7p1ACu4wNQxeJUOxobwsQT3I9wXvYWQ0qhHu1D/9NIcEi3O7+xR/3VsA1J0CMlSeZK632K0L
 aKOIMcMFHd0ZdIrjDMw==
X-Proofpoint-GUID: cpUSXerQdaDeRxAaZ30ygG4v3dKuB3EX
X-Proofpoint-ORIG-GUID: cpUSXerQdaDeRxAaZ30ygG4v3dKuB3EX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-112691-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFE2C67099C

On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > If a subdevice fails to stop, it indicates broken communication with the
> > DSP. Continuing to stop further subdevices against an unresponsive
> > remote processor could close rpmsg devices that could remove the memory
> > mapping from HLOS and in case if remote processor touches those memory
> > can result in SMMU fault.
> > 
> > Change rproc_stop_subdevices() to return int and abort on the first
> > failing subdev. Propagate the error through rproc_stop() and
> > __rproc_detach() so callers are aware the teardown did not complete
> > cleanly.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> But what would callers do about this? If you abort the teardown sequence
> half-way through you now have an inconsistent half-stopped state that
> neither a new call to stop() nor a new call to start() could recover
> from. That doesn't sound much better than the SMMU fault. Or am I
> missing something here?

SMMU fault result in device crash while other is non-functional remote
processor. From Linux side, we do not know the state of remote processor
when the timeout happens..cleaning the subdevices can result in the
debug data being lost for hung remote processor.

> 
> I would expect that we should either be able to tolerate the SMMU faults
> with the resets involved in the remoteproc stop/start sequence, or that
> DMA gets cancelled by the remoteproc stop sequence, before the buffers
> are unmapped. Perhaps the order of our stop sequence is just wrong? Can
> we unmap the buffers in the subdev unprepare() callback?


IMO, Sequence of subdevice is fine 

 glink-> sysmon-> ssr     start

 ssr -> sysmon-> glink    stop

glink subdevice gets cleared due to which this issue happens.., it will
not help as we are ignoring the timeout.


> Thanks,
> Stephan

-- 
-Mukesh Ojha

