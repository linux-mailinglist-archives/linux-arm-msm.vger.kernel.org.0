Return-Path: <linux-arm-msm+bounces-90164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAa/JS79cWmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:34:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E3654F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E35343E66F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A2B326D57;
	Thu, 22 Jan 2026 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nok1F27h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhavCC1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D73F3101D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769077342; cv=none; b=Xkxbe3OAZRfEU/QAjyMW8RjpmfJdW2J9Z+SF8tP/1WuN3GLrqkOY1WptHDa0beyVgk6IURnWdS1VVHowR9Vwd8qE8x3F5MIILOW1J1vWJTLj2qmvUPXm/0S6bXrEoa7Lnqoxgp29kS7dfa5IZ42k5Xw4OseFz8P9cf6djNXLY2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769077342; c=relaxed/simple;
	bh=mUzEwTV3dwSN/lso/GVMTd8+BwwF1qtxAHuOOROUMCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDVN6JlL8K5UjMKICSCm0Gl/bjy+zPER50Mzh1NMCiXHi2+ZtIsvo35dd3jCL1PrmPkR4wRldWQK3IHAVEQIGyEodVcf/MJ6Q78SXQ0l6OZvx+ylxkfWmTWl1lBieKtvpx+XOSodhB/GyKZlohCiUXWiNWFAYsS4FLegaMT9UgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nok1F27h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhavCC1N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M66heh3902374
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ep5QnDcp6sQDu4JB5aEYhZ5VmVnyTogSqCaLPVY9tRY=; b=nok1F27hL5N+TZAv
	z3hwITteIMlEzVEz6UicBItPfcQtasysVLRbsuqvHyKO3vg3TgwU06b/JFaF8wTp
	BKrnX8jKCTPqCfxfcTuFo5wvIZEYAZRUwjIpVvg8RDbkh7wifRdhtznAg0aIToLp
	nI42A+YTFvnKB2eNa/EO2LQBTe/aB/8CW8RJy0YvqLidL8lAirFVSPiA/QiuF+De
	qxBKkIkrHuXZLdONF1WNRlZsN0GahjBUxgODBSJW7jnbUZzWKQEQ1LY/K329kTSE
	VxYXa8305TBuQDLlvtu+WWL3vbTukg5Hh34moERhPvzBRwopHT6JG5fgMKS37I63
	FzJlHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khjeq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 10:22:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bc4493d315so203429285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 02:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769077338; x=1769682138; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ep5QnDcp6sQDu4JB5aEYhZ5VmVnyTogSqCaLPVY9tRY=;
        b=QhavCC1NlftzfxnD/CW6+biWAPwGRv3rxVRt29vF0mw2BmZyA94kvdTrHmeolHRcis
         HQAzV2aFJVfHMxZOR/KUmwW6XFkNWhqNGDXhIt3koZWdfu53IBA4PEqNZIQWz/XZkwZ9
         3hiOBTE+IZD8zvx68ojB5dIDpWg1AIWVWDRJaNftHcpfDxMbXetyuVcL+kNP58lzGnla
         19TXcOxwfV4cbSW1AomtRJu+8N0y8f9SrLy0byYeC1fNEdYHGtY/bR6fuP7Mp5Bb7CnH
         EnXjyzS5kCliFU1RhY0OJ1NV3AiYMm1MYsAqsNb1h9N421LYq7KlOGQiZj4m1X61Q5r0
         RJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769077338; x=1769682138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ep5QnDcp6sQDu4JB5aEYhZ5VmVnyTogSqCaLPVY9tRY=;
        b=P+5GC2GI4vlwEJZea9KjsoGd3pD5euRnHONW3NyVOj5418xlgSmktfvP9xnULU4S0E
         aEcnlSBb8pqZky7kxqABib6Qa+PqWAL/VODy4Jm++0dAEb/SUuZ0U5E8DCVtxsue7Y/e
         Wxu1QZEG0MKSMhJO1GUAXIwgABeZz/pyia8xgYwCSC7XvkiQyJS7nCnyohurVz4dAOSm
         dIzYXEAeAaN/gQxQ5KHqafPHnijfa8ggfbBu8jOp2DJ1ENGfdBLJbK1hUgizjvK9YAJU
         J0DRDY+BM7LOryueDuqFeZjnspBKl31yq7h41aSmAukrZFzhjsaM8id1IcWv639CRfcF
         sARQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6cBB+txmBMQs1ppIcITh/V+5PvGOVLhBk35sqkP2Q2TJs7WyMzaDGjymqgiWuuOXaosnXFUAgUs84nATf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzue099115fhFb4t+7LpdOcTti/2T2lOEyi7G3Z4DuOkD0wVIKU
	Yv8EC9EgU3MWcvuA3G58z1eWYEVKzkByZL7eM1YcYjpj4Bbd7kLwvbu4bijP8gu2w0sgeimfv9r
	e8MTfLEUXZiPkELBi5mFfYuhsaawwsT7eiE3soPAkO9q/Lu4dbAIrJlO5aquIDTQb2sp8
X-Gm-Gg: AZuq6aL6L2rIQsoEwA2ttWs5OekP75tq1ssHcJfOjjsBBn6Bxo240eMmkX8J6fTR1uY
	nN8GzR/wRG587sDs4qe3RrJpz3o8jHzzUH4UExIDAkTnN3dJeDW4XnJeo/YllYn5DhAnfFNA6uz
	isWd8fcm2uf37d9pqIRoguJdAubs8DpvaSliwJSsahV2ZJplLRPFXCN50WDMK1Xx8XsVcGebW42
	LKz451BiUg5WtXbaIDqQk8zCvL5QFL0XDBY8HgfFw8Y8tBdmAhZtXrWyM3FWYrkz74QPntz7mxl
	sE2O/fEa6W92NYo3ZBHYFVgUkxns6qak2lgE336knoNQEd9YQ2uuEWhWkO880bPG+ETRcSYXv0y
	PHVbfLP7SfPUajTcAYHT7G0x+7JRVMnyORsL6kMwGYd/DF+mm3s55pMCjFv9dROB/tULzyMdQSV
	PMqGBTfHlwRnMMpxw6mI+fIow=
X-Received: by 2002:a05:620a:4627:b0:8c6:253d:5187 with SMTP id af79cd13be357-8c6a68bd2a5mr2683835785a.11.1769077338053;
        Thu, 22 Jan 2026 02:22:18 -0800 (PST)
X-Received: by 2002:a05:620a:4627:b0:8c6:253d:5187 with SMTP id af79cd13be357-8c6a68bd2a5mr2683833085a.11.1769077337585;
        Thu, 22 Jan 2026 02:22:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d324e721sm663241fa.17.2026.01.22.02.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:22:16 -0800 (PST)
Date: Thu, 22 Jan 2026 12:22:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3MyBTYWx0ZWRfX34CQXHLUnWaS
 mMpglc09F+NlnV5E/phmRIDa3HXsvbXE6G0uP8kLkd0J60khr2eQnjhYhew6V8ulmil/2bEHAku
 6RAOiMUEF/wX653J6xW6gbTJ460PKESv2GaDfTKNY/+vLVOrNHJPAlFDO2yvPlml5WOEiB3ld4t
 Yc+P7f+wccTQyB7pupXakrulhYLjX+LCG3uDoZ+kx/6YlhNVMt5zdPT18oMheVZAlJMI6qDlkdj
 /6I2LIVbI9OJpuj4hh3lzJjQ4jxn2X26qC2lt9s8qzC6dUOcrq8HDhCyZYmkx/XhKhpBzRZavjU
 kp3J1Q0jWSPq3ycyPjIujeZegt47OCmAQ5k6wNUIdaulWeF9mHR5DHgnNYU2GTPDdxEiDxkFphz
 wdva6oSxC3ODXD6U7+u4+P+YnMf/Sya8vd7QrQMoJfaZp0aZ1ozXfDfJ1FROuCtKCtV3q9oTfE4
 cq3qhfQSQHl7p+cLWTQ==
X-Proofpoint-ORIG-GUID: rxF1RX4_TpmsAMNYBZ2rH5hTueERtppq
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=6971fa5b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bGBrU2Q4kWqJuByW2JMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rxF1RX4_TpmsAMNYBZ2rH5hTueERtppq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90164-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E7E3654F0
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
> >
> > On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > Currently, plane splitting and SSPP allocation occur during the plane
> > > check phase. Defer these operations until dpu_assign_plane_resources()
> > > is called from the CRTC side to ensure the topology information from
> > > the CRTC check is available.
> >
> > Why is it important? What is broken otherwise?
> 
> I see. Thanks! Will add below lines in next version.
> 
> By default, the plane check occurs before the CRTC check.
> Without topology information from the CRTC, plane splitting
> cannot be properly executed. Consequently, the SSPP
> engine starts without a valid memory address, which triggers
> an IOMMU warning.

What is plane splitting? Write commit message for somebody who doesn't
exactly know what is going on.


-- 
With best wishes
Dmitry

