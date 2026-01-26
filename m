Return-Path: <linux-arm-msm+bounces-90558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA1sFnFfd2n8eQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:34:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC62B88566
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 608CB3002B79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA9F26299;
	Mon, 26 Jan 2026 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVECKN/v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVCvmxaB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDA4305E01
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430678; cv=none; b=LK2vE/i5jmS2xRQl+3TYQ+zcW9nalq6CNJxBgByw8aejrNCBUrZ54Xr9YILtcIFL5WtQmGd/OYKXfiYNewBFal8fnXAfP4ln59YWukQUJUY556rTfms2DyyGg8M8tK7DlgzRbY8slfiqmPFLNXXrEl/3d1wrNC2RiZ6ig4qMWgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430678; c=relaxed/simple;
	bh=vrHdVi6s04Zl4mPmt8MbHThI02XV5H4nsCLeaOfksUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0ok6dd4695uhRCEfFNG3bjUcW6Xuwgz/TX6pF08fdJpoIav0DGNAXKQ1TtH2HUi7KOZygVTXMv9Gd9JXOhtpuF28qPqlgFBiXkgqvawyMddaUbbdQOlga9M5p+I0X6RdIuNVCA5xA7aowYyxkYTtuoA6xSN16Q4AvAUAH5+xs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVECKN/v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVCvmxaB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q40q4j1361590
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YowEKJ40jbpJCqNsApsI7CaWnCkdpx8Z+MxoMBwJhG8=; b=UVECKN/vXP74zhHK
	i49rovL5MlaGkifwFD8cPrWe6fyDk7Pzx/tgGcGoNAVwgTLlQW7iwqt6UEmbVkLn
	mwgLsVorsPNemDfx2f4rBxlPYNMm40Bh/cfRBVXo9AtcVUlx8Ckn1WH/Kn3rbUFV
	X4uUHZLIfUD4mq6eV018kJAXbY7PHk6TxuHokYtwGrXvRaKOShF6vscArbbjtsa3
	QswNiMtxz0JwOomb41XSAcQcUTwHu4Q0q+9yQZIudKb0Lgsi4XLfUHrn37l0vbpc
	qgu6qq3KOkW/yiXZAzxJsTCOsaONc2fAJeKKiH2uiuKnesVw7el5BY73bqGWrRYX
	q9WNmA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v31529-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:31:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6cfd52556so1195024285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769430675; x=1770035475; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YowEKJ40jbpJCqNsApsI7CaWnCkdpx8Z+MxoMBwJhG8=;
        b=kVCvmxaBeGRq5z51YTZEJo94PLrb1FN8JeHcHCeISNmSEorAMH8eBqQJoFLY3yjW2s
         zWeCDNEcvTpiZw5QF1fsaBtAYDojC6h/Q7HP1FcLGzDoU2hiW/tf34ZanNXbJ9Gpfic3
         298E+eC43f0Tznm1K0AxbNy8TSyX1JYXTrHdVcpZZy/5tbi2a9aOyrMBK+7u4ihm255K
         xxjExqMYT6VAixo4F6XvlkchKl1UyW5DvKGKZUfOpDMpW6gk4nqmo+EwRKLs/tpK3nzI
         eDLQNyQImR1zY0qxOk1wV6PsxADk1THsiRXDMRs7sAoCf9XS9A29Q3T4SWS22KyoqCrW
         af5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430675; x=1770035475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YowEKJ40jbpJCqNsApsI7CaWnCkdpx8Z+MxoMBwJhG8=;
        b=vC+QLy/otEYAFv08dnR0RBmoglopzUHg9A68jAxshmNF4AEJjJpCW/eZG7VmLeZHP7
         kwgCvOMVQ82KXSxWcQ3GLPLEa823sy2mFZNN276xHpkyMEgdra6QjMH4+WCdgGV365xH
         gJJT3aQbQ6jTKksDqRSvTHv9aADd9OsB5Wte9njC1lmr8bWZ6CyAmOs99dw92R/yZGvX
         6NOyylsZNT9IjJ+qdtAXsnMorYifUZVtF+0+ROxvARk78daP18eh4CjvRYwQ1HaswSTk
         hGlrsJRUtSvFQTidbCgT/rqtiakEXl8MVLeu3S3iMnBOd6p5J2GzY4v0RJP009719zRE
         7xmg==
X-Forwarded-Encrypted: i=1; AJvYcCVITpeGK+/ObAmDo7mDWWRs/ZH9df7iFbLZN3o31XEU5i5AMV4/5h++6efEKbZRsvNknB4U1DTA/j0rCQDT@vger.kernel.org
X-Gm-Message-State: AOJu0YzltQ+cWBWy4aKrq5pZzY6euelfLiD/7u7yD7hqIsAGfoZPmaLJ
	k0Ln62kLM+nsq3F1CHu/64Q2Vy09ElgUF4AMR9r8/zPJQ3w9ObLdEIdRwsQN1ZF8QWczwQd6qQL
	o5ARCamArfjNFdGhMtPtEU3RZrfL+A5BhvkpNebZPiy+nhMvWsjRsKW7w10O9wSl+36SV
X-Gm-Gg: AZuq6aIsilDQRtbyMiR7HkrUF8Fb/16Fl06YypMKAfDCyEk35s93KXtF2AE4ch66Vai
	gP76xtywLvlMftNHNxyT7/P4wSE+cx8NLoRQWzLDsYoNxnxsxgjvAD0CfS6id4dmP6z2z09OLA/
	Za39RwFFbITOCA5XNSzTeBkrtOow/QE+DOLNi6iw+B8OXHpidqgwIx/tahyQ1PDoYbxQCsjy/s4
	t+WzGOxXFf3FbKWNdU+B6ovmZ8u/n6ArD0E0FJIOWstupfo1gdRyARXkP9aNVmNuj+rkWS9OMEw
	IrHfIEWWzwdOvtuUss9a10v1hAcaS8Fe+NfYEBhVc04r8jgbhenRkR/xq5XyXZXO4CUmGhDJDzA
	eOBHIB+gObDs4QxySCiZ/L03nDHc+BFq8t7n/UIx5YOT1U0Q1BHyjELBMhdr+fVKOOFOzwHZmER
	Qw7s1v/SC3hvoZW+HNelF5IWA=
X-Received: by 2002:a05:620a:7001:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8c6f97d6809mr431743285a.10.1769430675435;
        Mon, 26 Jan 2026 04:31:15 -0800 (PST)
X-Received: by 2002:a05:620a:7001:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8c6f97d6809mr431739385a.10.1769430674982;
        Mon, 26 Jan 2026 04:31:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da170f70sm24274671fa.27.2026.01.26.04.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:31:14 -0800 (PST)
Date: Mon, 26 Jan 2026 14:31:12 +0200
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
Message-ID: <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwNSBTYWx0ZWRfX7Pv+7tn5pvKI
 m7K+BvsU2f0RkUro5O6BRfFDzv/ez/dNmZkv5xAMdf/1PwntUJreiHWRSDPeNoK3P2CgrEeWR09
 cHgRu/NrXt8n/MVRrt5UVHvKAoK4OGwq0An6XQBeBLCsBlC8l3DUvQfNfzzZJRKYayjE7OYwPkp
 9WKNbHAQBtWKlMsNTDowz0+UPAAh1XsPaRi8rsOT5MDi0xVEYPe2OTHSZ9t2qIrupWlJPZ8sv2H
 yS+nqFBnaLFy/88pv8V3i6Ppftj1zgffpTzAYnMpm311BtHx9YYj4zcwWV2IlZ3i6RD9EQR/bgx
 fvazsguTWHAq6Exk5lRP7lYZN/79AlN1oaGG7DT1xcKn2+53BAHbnrfx91St9Qs+TlINehG+LLX
 RU8tSa07eda8cY5rtc1vCluq6dDaBGK3vBW/CVLKqAR2OnBcnkgrZ+MGJFrtj3fmGSMKHAHHgqM
 q1IUGLBsF8q0imV86aA==
X-Proofpoint-GUID: pwzho1JWTuzNII6MN_R3tSFR9mt0pIfu
X-Proofpoint-ORIG-GUID: pwzho1JWTuzNII6MN_R3tSFR9mt0pIfu
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=69775e94 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=u8JMoutS_zwJ_36QwrEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90558-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC62B88566
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:49写道：
> >
> > On 26/01/2026 12:29, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:13写道：
> > >>
> > >> On 26/01/2026 12:06, Jun Nie wrote:
> > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
> > >>>>
> > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
> > >>>>>>
> > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > >>>>>>> Currently, plane splitting and SSPP allocation occur during the plane
> > >>>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
> > >>>>>>> is called from the CRTC side to ensure the topology information from
> > >>>>>>> the CRTC check is available.
> > >>>>>>
> > >>>>>> Why is it important? What is broken otherwise?
> > >>>>>
> > >>>>> I see. Thanks! Will add below lines in next version.
> > >>>>>
> > >>>>> By default, the plane check occurs before the CRTC check.
> > >>>>> Without topology information from the CRTC, plane splitting
> > >>>>> cannot be properly executed. Consequently, the SSPP
> > >>>>> engine starts without a valid memory address, which triggers
> > >>>>> an IOMMU warning.
> > >>>>
> > >>>> What is plane splitting? Write commit message for somebody who doesn't
> > >>>> exactly know what is going on.
> > >>>
> > >>> Thanks for the suggestion! Any more revise is needed?
> > >>
> > >> Sadly enough the text below is not a significant improvement.
> > >>
> > >>>
> > >>> Currently, splitting plane into SSPP rectangles the allocation occur
> > >>> during the plane check phase, so that a plane can be supported by
> > >>> multiple hardware pipe.
> > >>
> > >> What does this mean? Without virtual planes in place, there are no
> > >> multiple hardware pipes.
> > >>
> > >>> While pipe topology is decided in CRTC check.
> > >>
> > >> ?? What does it mean here?
> > >>
> > >>> By default, the plane check occurs before the CRTC check in DRM
> > >>> framework. Without topology information from the CRTC, plane splitting
> > >>> cannot be properly executed.
> > >>
> > >> What does 'properly' mean here? How is it executed? What happens?
> > >>
> > >>> Consequently, the SSPP engine starts
> > >>> without a valid memory address, which triggers IOMMU warning.
> > >>
> > >> IOMMU faults. There are no "warnings".
> > >>
> > >>>
> > >>> Defer above plane operations until dpu_assign_plane_resources()
> > >>> is called from the CRTC side to ensure the topology information from
> > >>> the CRTC check is available.
> > >>
> > >>
> > > Thanks for the patience!
> > >
> > >
> > > Currently, splitting plane into SSPP rectangles and allocation occur
> > > during the plane check phase. When virtual plane is enabled to support
> > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> > > a plane can be supported by 4 hardware pipes. And pipe number is
> >
> > number of pipes
> >
> > > decided in CRTC check per interface number, resolution and hardware
> > > feature.
> >
> > Okay, but IOMMU errors were reported with virtual planes being disabled.
> > So how is it relevant?
> 
> After revise of splitting plane into pipes, the number of pipes will be decided
> by CRTC check for both virtual plane and non-virtual plane case to unify the
> plane handling,  instead of assumption of 2 pipes at most.

This needs to be explicitly written.

> >
> > >
> > > By default, the plane check occurs before the CRTC check in DRM
> > > framework. Without topology information from the CRTC, plane splitting
> >
> > WHat is plane splitting?
> 
> How about: s/plane splitting/splitting plane into pipes ?

This plane is not being split into anything. It's being mapped onto hw
pipes. But before that, the number of necessary hw pipes is being determined
based on foo, bar an baz,

> 
> >
> > > will be skipped for the first time as pipe number is 0. Consequently,
> > > the SSPP engine starts without a valid memory address, which triggers
> > > IOMMU fault.
> > >
> > > Defer above plane related operations until dpu_assign_plane_resources()
> > > is called from the CRTC side to ensure the topology information from
> > > the CRTC check is available.
> > >
> > > Regards,
> > > Jun
> > >>
> > >> --
> > >> With best wishes
> > >> Dmitry
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

