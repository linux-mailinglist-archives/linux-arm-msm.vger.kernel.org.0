Return-Path: <linux-arm-msm+bounces-91756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNoyInyygmn/YAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:44:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E1E0F4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 03:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66088300B452
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 02:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535AC2D6E7E;
	Wed,  4 Feb 2026 02:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEKV3k8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlaSxpVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5162D6E73
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 02:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770173048; cv=none; b=Q64v2soJzuj+RYB87/+fKl7j9Eo5WCMvYPbLFoFdGMuRlxGCJLSNy4mbWlWoxfzyuNrIxL1365rpspTs9N2amY+f8DK+wAZLoOEQZTfHrPOjMccU2ZHQUu366Rf8wX3keCnhSJiCk1zp6ipmT16HqUdaBpbcUV9ErW91YSEIE6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770173048; c=relaxed/simple;
	bh=qyhkR8KW1/YSXSkqquyteAAm+V1RQPBItAOAS2AeI4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7GQj+rA41lzDoNYyCTvdI1iNL6EgAUgZkKxIyQLgzy1X8WeLm0khxaTNazD8uOg2wQPIF65/f3I8h0H6PiJGEPqrZDym/S+WuN84o88Wb7xUybyy5u9Y8tKsEW9nlj0vxUT9HA+o4a0BZ4jxvd0cm2hAz19j/OkHGvGgztNocY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEKV3k8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlaSxpVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ilw8V2053643
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 02:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CW6cnxq3e1k0I/EmtCFkaNna0AlWgIrLYSneweRw5q4=; b=nEKV3k8EyrtraurV
	VfjdOitMwTLB7Ikd/m37Zu8Mu7YnJ8AeAHf6DHRdkkGyfwMkNLnHfDRX7HcCgvem
	MMvOpmvzt7UgQvwtMFk+6Lgj0trDatcH2qV3aIO1ELEqAa5HVWunX4kCKUe82Omh
	w/OTD4+DG8ZgRMCdqmDhSooqV7ZbI6HAb9oEkebZX9pKhM2P4UAv6xLj8hbS67qY
	ADEmjbBa/F/0q1PH3GBreEfgoA0SrrWB4Ym3IcXXTPd+FMyelCBFTDjKDrmGwGpn
	n9arG4GpVg+6B6m3uK377ou1rJ4QQuB4InAVky0Yv2fMS4FFvZuYrLCWOEZv8ebA
	tVCSgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gsr2kt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 02:44:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c1cffa1f2dso146079985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770173045; x=1770777845; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CW6cnxq3e1k0I/EmtCFkaNna0AlWgIrLYSneweRw5q4=;
        b=KlaSxpVdQM2C7RZq5vz7KCiqzk1CNv8epnvg0A/1HKRMs4HKn9q0lZjy5Iv5N1BSf0
         rLutbQFU4eua7LFfz5XmZLbNMhPM5ByqUDu5SUjgLfhkYPHKXCSlCmq72l2aQb+XIBrK
         1fD6VN+oFX4huS9ciQncdiNxRdog97o/XJMlCB2ocpzmbfcORaVuML9UA3jEUCPGwDKc
         pVQTJdcbeaCH27ycOZxKhjq19DRhugMQgEefrI3+Va8iFswiuiIQwBmod4/DQBSzkDaG
         uQGoxA5JV7HRrZKk3JIQW8y2JoMEgbIlw5wmKxK72hxYrMK8BGPHhBDfVGQ1dhdzYu42
         QAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173045; x=1770777845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CW6cnxq3e1k0I/EmtCFkaNna0AlWgIrLYSneweRw5q4=;
        b=GEP/phMUT9h9Dmp9B2TfPdSos3yy7GXg205/3MaODe5LPoQcPuABaLCxu2nsWh7WpS
         hlDWjy1vvXnDW8Eczj//IsW5Q+S+qFFfV+eQAwD/xe95ySox+TdI+BWcGI0KOfVOFIeu
         Xd4cIZTl+9ivWvSNI9x0E4HZmIAxaTBGO5sl3qUVzkqaPxEKgFQcVS81vmw5TfmDSzAP
         WHo43EwHWHLHifSFsx5jIYtaeBX9JxAdk6f74VWXibRvRtaohh6Q9pnS6jYINbXa7sLN
         v8APbhXZ+XXm08YxbkKPP0Vi4Heyuvfgl4gTCtI2I8/IUN71UGnBnNJug7rh60QeZqDm
         GQEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM+uEejlET5NSRt8zuve5zfm9EQtKYapk6JjVCOjvlunpF4ZEgwgPF7TPSs+64qnWd7CT531OfLXXt7juP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69NAamc/kdUjW/09xVH8AgCXVM1HeFZ9nbBzOwvHC9pxW6rHJ
	Hbob2jEUcSZGyOBUeaDfEe2KOnser0EZwkdSCLv7tRDHU6hdvvncNMNwp5PEJMNkaa8XUb2xQs8
	JIgxHgWrULM6/xnviPWzL+Cmu9zGW8/FJXekV//KvZoDHjq6h8vHaHgJBxJ9DUOd8OAyL
X-Gm-Gg: AZuq6aLBrqweL/bEmMkmzZWlB8NAcG+BeNBSIx0YW1KT78k1E9E5JRsQn3H3zxmqaww
	yA6enUgnAB9SRhAnk8GZjBCAXzxhI9vtxWszBDRKJ1ecdospSg4VgY2P3hIBylotWATiRaZsna0
	Dhc/TC2+lwYJx6JfgToMv4ZlwJ4C3wL6fyTFhlOnyXism9/H5bc062EHDrHyMYp7swFxaCs2Zu4
	WRjdVhw2KsG7nrPP6asRx+mbCq0AxXlSjoqD64SWVXiEWWJOZu6FDbft8j2s3WO2oN2x/5pcDEf
	VTgoI9T4BCf/dbjPqPW3Ph6ktpHRUsKF6UG4aTI6Pw+frkzAMnN0+nMHFgtl+7Le+fOQ36MYKpc
	15REcZI2ztKu6CGi/2G+8Vs+kVbffbrwURaCyZEVbTBdeCYQqtKDQdjz/7YlVj7bUDDA83F+w8N
	XR/FcRORznrPBQbVQIW3cgcOM=
X-Received: by 2002:a05:620a:40d1:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8ca203467admr597154785a.10.1770173044833;
        Tue, 03 Feb 2026 18:44:04 -0800 (PST)
X-Received: by 2002:a05:620a:40d1:b0:8a3:a42e:6e14 with SMTP id af79cd13be357-8ca203467admr597153385a.10.1770173044314;
        Tue, 03 Feb 2026 18:44:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3869207004esm2334061fa.48.2026.02.03.18.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:44:02 -0800 (PST)
Date: Wed, 4 Feb 2026 04:43:59 +0200
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
Message-ID: <5gninhmgt3udo3nxeo46lpydv24v7zy6ahuibshohd7flbw5nl@gwf2fujuzo4u>
References: <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
 <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
 <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
 <CABymUCOmq_FVOQRVQSz97wjF_gtdji4dXz0CucChvFyqmyw06w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOmq_FVOQRVQSz97wjF_gtdji4dXz0CucChvFyqmyw06w@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=A+9h/qWG c=1 sm=1 tr=0 ts=6982b275 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MF6XG58hdB1_LbVRQekA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: cfH5ZIRHLtS5c7bReXMI4AyKJjmuOn8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNyBTYWx0ZWRfX4/TfWogZ3c/E
 md3m5bwRf0YWI7uMdzb0G0ChgYt1oXentxj0sZYHp2OuVHYAqoqq+1TAFI/spKw1G9OCpHCj2NZ
 dzyeN+tZ6G2z0/CW4rFS+x0jVJIs22eEsSUsWQuCTTvuXL3NO7FXziGfUGJ1caQqyeFFXbB4Tg7
 go8kOnWAB7TczMWLWPKyDiUEvXgCVsUBrnu2t64OrksUJ2a3UlNyO5BtCX4CD22XNjPlUGXQioH
 p1WlWLig7vWT+sMINWs2g5BWJGIahYq6tH/1rLludx9j3bWuvJGm4CWCVaelU42LTXVoCUS98tg
 340WR9H6sOWT9cYYkP5rzbxapufqcFY+MuzJYZ1yXk4seiY2OZekHyS01jK1EKLybiIPTXvT9OX
 TBmTbfrLssuzLjHA7ujn/pHRjky6Vhk/E3aFQoX7c/QRXBk6UCjGk6ARabILKIf0jYUzKHjuUZ1
 IzsWVGRYjshxEoVlJ0A==
X-Proofpoint-GUID: cfH5ZIRHLtS5c7bReXMI4AyKJjmuOn8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91756-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B24E1E0F4F
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:15:14PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月27日周二 03:06写道：
> >
> > On Mon, Jan 26, 2026 at 09:29:44PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 20:31写道：
> > > >
> > > > On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:49写道：
> > > > > >
> > > > > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:13写道：
> > > > > > >>
> > > > > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > > > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
> > > > > > >>>>
> > > > > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > > > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
> > > > > > >>>>>>
> > > > > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > > > > >>>>>>> Currently, plane splitting and SSPP allocation occur during the plane
> > > > > > >>>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
> > > > > > >>>>>>> is called from the CRTC side to ensure the topology information from
> > > > > > >>>>>>> the CRTC check is available.
> > > > > > >>>>>>
> > > > > > >>>>>> Why is it important? What is broken otherwise?
> > > > > > >>>>>
> > > > > > >>>>> I see. Thanks! Will add below lines in next version.
> > > > > > >>>>>
> > > > > > >>>>> By default, the plane check occurs before the CRTC check.
> > > > > > >>>>> Without topology information from the CRTC, plane splitting
> > > > > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > > > > >>>>> engine starts without a valid memory address, which triggers
> > > > > > >>>>> an IOMMU warning.
> > > > > > >>>>
> > > > > > >>>> What is plane splitting? Write commit message for somebody who doesn't
> > > > > > >>>> exactly know what is going on.
> > > > > > >>>
> > > > > > >>> Thanks for the suggestion! Any more revise is needed?
> > > > > > >>
> > > > > > >> Sadly enough the text below is not a significant improvement.
> > > > > > >>
> > > > > > >>>
> > > > > > >>> Currently, splitting plane into SSPP rectangles the allocation occur
> > > > > > >>> during the plane check phase, so that a plane can be supported by
> > > > > > >>> multiple hardware pipe.
> > > > > > >>
> > > > > > >> What does this mean? Without virtual planes in place, there are no
> > > > > > >> multiple hardware pipes.
> > > > > > >>
> > > > > > >>> While pipe topology is decided in CRTC check.
> > > > > > >>
> > > > > > >> ?? What does it mean here?
> > > > > > >>
> > > > > > >>> By default, the plane check occurs before the CRTC check in DRM
> > > > > > >>> framework. Without topology information from the CRTC, plane splitting
> > > > > > >>> cannot be properly executed.
> > > > > > >>
> > > > > > >> What does 'properly' mean here? How is it executed? What happens?
> > > > > > >>
> > > > > > >>> Consequently, the SSPP engine starts
> > > > > > >>> without a valid memory address, which triggers IOMMU warning.
> > > > > > >>
> > > > > > >> IOMMU faults. There are no "warnings".
> > > > > > >>
> > > > > > >>>
> > > > > > >>> Defer above plane operations until dpu_assign_plane_resources()
> > > > > > >>> is called from the CRTC side to ensure the topology information from
> > > > > > >>> the CRTC check is available.
> > > > > > >>
> > > > > > >>
> > > > > > > Thanks for the patience!
> > > > > > >
> > > > > > >
> > > > > > > Currently, splitting plane into SSPP rectangles and allocation occur
> > > > > > > during the plane check phase. When virtual plane is enabled to support
> > > > > > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> > > > > > > a plane can be supported by 4 hardware pipes. And pipe number is
> > > > > >
> > > > > > number of pipes
> > > > > >
> > > > > > > decided in CRTC check per interface number, resolution and hardware
> > > > > > > feature.
> > > > > >
> > > > > > Okay, but IOMMU errors were reported with virtual planes being disabled.
> > > > > > So how is it relevant?
> > > > >
> > > > > After revise of splitting plane into pipes, the number of pipes will be decided
> > > > > by CRTC check for both virtual plane and non-virtual plane case to unify the
> > > > > plane handling,  instead of assumption of 2 pipes at most.
> > > >
> > > > This needs to be explicitly written.
> > > >
> > > > > >
> > > > > > >
> > > > > > > By default, the plane check occurs before the CRTC check in DRM
> > > > > > > framework. Without topology information from the CRTC, plane splitting
> > > > > >
> > > > > > WHat is plane splitting?
> > > > >
> > > > > How about: s/plane splitting/splitting plane into pipes ?
> > > >
> > > > This plane is not being split into anything. It's being mapped onto hw
> > > > pipes. But before that, the number of necessary hw pipes is being determined
> > > > based on foo, bar an baz,
> > >
> > > Thanks for the correction!
> > >
> > > Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
> > > allocation occur during the plane check phase. When virtual plane is
> > > enabled to support quad-pipe topology later, 2 SSPPs with 4 rect will
> > > be needed, so that a plane can be supported by 4 hardware pipes.
> > >
> > > After revise of quad-pipe, the number of pipes is decided in CRTC
> > > check per number of interfaces, resolution, clock rate constrain,
> >
> > Where?
> 
> The pipe is decided in dpu_crtc_get_topology(). Change to quad-pipe
>  is made in later patch. So I drop this in this patch message below.

The pipe isn't decides in that function.

> >
> > > hardware feature and virtual plane enablement. The decidsion of
> >
> > decision
> >
> > > number of pipes will happen in CRTC check for both virtual plane and
> > > non-virtual plane case to unify the plane handling. Before that, the
> >
> > will? Do you mean, after this patch? If so, please use imperative
> > language. See Documentation/process/submitting-patches.rst
> 
> Yes, it is in later patch. So drop it in this patch message.
> 
> It is possible to keep plane check unchanged, and rely on re-allocation
> in later stage to support quad-pipe, if quad-pipe use case is detected.
> But to unify the allocation logic for both non-virtual and virtual plane
> use cases, and to centralize resource management, we'd better defer
> the allocation.

Which allocation? The non-virtual-planes case is more or less static.

> 
> 
> >
> > > the number of necessary hw pipes is being determined based on
> > > resolution and clock rate constrain.
> > >
> > > By default, the plane check occurs before the CRTC check in DRM
> > > framework. Without topology information from the CRTC, plane mapping
> > > will be skipped for the first time as number of pipe is 0.
> > > Consequently, the SSPP engine starts without a valid memory address,
> > > which triggers IOMMU fault.
> > >
> > > Defer above plane related operations until dpu_assign_plane_resources()
> > > is called from the CRTC side to ensure the topology information from
> > > the CRTC check is available.
> > >
> > > >
> > > > >
> > > > > >
> > > > > > > will be skipped for the first time as pipe number is 0. Consequently,
> > > > > > > the SSPP engine starts without a valid memory address, which triggers
> > > > > > > IOMMU fault.
> > > > > > >
> > > > > > > Defer above plane related operations until dpu_assign_plane_resources()
> > > > > > > is called from the CRTC side to ensure the topology information from
> > > > > > > the CRTC check is available.
> >
> How about this commit message? It is more coherent with the change
> in this patch.
> 
> 
> Currently, a plane maps to at most two hardware pipes, and SSPP
> allocation occurs during the plane check phase. However, when virtual
> planes are enabled, SSPP re-allocation can occur within
> dpu_assign_plane_resources() during the CRTC check.

There is no _allocation_ for non-virtual-plane case. The SSPP are
statically assigned to the planes.

> 
> To support future quad-pipe topologies, which require allocating two
> SSPPs with four rectangles by default, it is more efficient to perform
> the primary allocation in a single pass rather than relying on later
> re-allocations. So defer the allocation to CRTC check phase by default.
> Allocation logic for both non-virtual and virtual plane use cases is
> unified in this way.
> 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

