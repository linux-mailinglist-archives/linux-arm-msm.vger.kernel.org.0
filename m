Return-Path: <linux-arm-msm+bounces-90385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMWlIbDTc2kCywAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 21:01:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E147A701
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 21:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DD543004DEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56241FDA92;
	Fri, 23 Jan 2026 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/aXxdvL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0w1DyHP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4003D6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769198510; cv=none; b=qT1YtSVHTQmUlUGNmNvsP82fqbqNEcs+7FYgwPqZsivEijWL5ODGADsJKX4TgL8ahxbKf+p/bibAuAL7lDj9a6iXC/2zSAg40fAEuQD7BLAaGXdXgkA0gOgeZVLjdPCV4RVaXI/AB11vzxidf9s4OxgjSgfVHVoWM83B4W8bmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769198510; c=relaxed/simple;
	bh=HQa1dso7aP6z1fQza2zERoT8P4/7FVAFQTUB4DDEfNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNqDAs8ZzKUC9epRy0BOu+33kt+hUD8XjQiMUhaJs31UrSPoYbLbrl3pdwPVUEMY0PfWjSxSqKEPKDl8izocU7bJ0T45g7l67D5oAAz4Q7vNhuDAGTj1E6Qd7oXPNZv+NvmhjzhlJba6DcfKJrvp8KK+/keTT/hjzBLGiW75Qao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/aXxdvL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0w1DyHP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NF8iKN1267935
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QO9fOs8BxvQ8WpaH5XwHVqxgxLsb6bKPzQB3chuzJo8=; b=Q/aXxdvLjMTLlE9d
	kRx0SHYqzDN/ae+5dN1EyvqWKDmhRwLqFBzhQ1mpFPaL3ZmIZxk35Q+pSFJBQ/50
	Bh+Bw4XLihxybVZhIY9/CEEMjZgnWtBVRrLR3hnh7GJ/+ezTI3dbb/ds0Eeqc2/c
	gQW5k1rJ+aUX7bjRAvAZioZTVlaEZUfPLqsHJcms0WiPnFveMWo7XNCr22Mq/5Gu
	knlqRXD3ayxkgtRneu+OR9vuKOGj2ZU33Qe6EFSGoCcKf5CldpfLj3+gCSymcZUj
	Rej92BH17KxXZxiIJhLtofIzDzPeB5xN6E6mf4MzY8iMr9ZSNgniLMrkfB+pSqV2
	V/41Jw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv4v9ae5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 20:01:48 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56637f625f2so1525154e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769198507; x=1769803307; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QO9fOs8BxvQ8WpaH5XwHVqxgxLsb6bKPzQB3chuzJo8=;
        b=d0w1DyHPDvGLPgyIsLERKMUeVmfwc29Q2jBWMbcjgQXwxVhdXLevaoIEg2XfrFJ1oY
         RQa6vD05uZfpd+t9ICM0gek+qpRKlKot8Yl82gQhoY2AaWywlLG+YiBLcT359yvtLe1O
         8X3ETRkoXvXDWnDgCgSXLCo8KuCucHBjQEf3aXiyjpefQIsRSS3jqNpZojH9LQLQbYHX
         GcFZa3ws2M7QpaV8E/McDTZBQx42SUSHR2Y+nYXzXMCKQKqNkbUgIc5S7N/tFmRHjei2
         8e0FOpq2Y+fmJ8PfjoRCGvTZm9VNzSIefxvBhBtlxIzpMwAIS/jJTOlHd769gJv91ZYS
         BO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198507; x=1769803307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QO9fOs8BxvQ8WpaH5XwHVqxgxLsb6bKPzQB3chuzJo8=;
        b=KDjfwFXuCvGXQUQc7quwmHrF6Su5X4btjq+DZ8gSCEblLHPy42lzkoLPnQyfc/qA2c
         Esxv7EbJ7cXblvU/5Jw+Vh7Otd2oEhkAi8d8tqyab4I83e9VSfQ9xijbJi1ngYZAL0xb
         RcE1C1YiF/JBWCWlPoXM3bRN2rK1L6vJ4fNVk/8P1FxbgEWQn2c4hwNZy1W+//DonSdc
         n/QKbbSYVYFljqiwiwEFf8ZsyLftpAhjS0XTc93G1NR8SM5iYiaQ7NuiNQY/PEzExeZY
         81S+ugSBZVsbvzDN0KypW1bWwRUAykdnneXcN3IyftoIvHlSY/WlPBiGsdEdHhjIeIQ2
         qtmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPQCnzmJLCH0Ec3gp0Nd71fRsl6YkrEQwaGnJY21Ljv9N15L8JvEOvmwt3claW6QYMfbHHu7yfVvW95SNd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DtMWelwW+k0yiuVR+FfLxrvu6v8I/mljFTe2ipyL/u17W4hQ
	gZJFjLeIyxc5gMViw65+Uy2yZ4eCkeBP45b1xVhVzb/KGvMGFBHpSLkTrbr2YaDJbuhZ0lfE6wR
	W0BMK8oomcOcmsjc12rFPK2CrEdaDPLhwdObtzTfcPyNGhlizvY7QQheWwi8vZO78NpXh
X-Gm-Gg: AZuq6aJrUOlJ1nOqB5QMSqkAtnyodUcfQONmIomoKpwQdqJJFxd7qqQz1pE1S9xIyqp
	EPJhDDm3y8Q8ggMx719Qov6I2wJPd+vH+w5d6PNiOQZ8C0YHMp4L9CojVLraRgjhg2jKCTvEGmy
	d3hZjF1kWb0US7inZ/Sn+ONe4ULntg8wYX+U76xxsk7YjJjX3OTLNIMbGS9eL21TfoslEvA5RKL
	hXbIa3j2NOHqYkm3yxW+MmTnOMWNXdseQcChdx9CliVEAagl2RmrutQIZAgdaAcBsSDkxRAP34S
	L2XgkddIu+Ks20aEz0snn4y+97jmQWW/rQGFURMpj+chrY+XsNRhLqIKz/wCi/aDUr6Pc5UKo3C
	uaDRrnmpvJgCx64EMOL4NQkZrZz6uHuiZtBti0X0gmET3xi09EMsBQh5zPYL25yFkCFM2FAj7cC
	mn4hEjWOfhoRPNsiSJleCuonE=
X-Received: by 2002:a05:6122:62b1:b0:55b:305b:4e2d with SMTP id 71dfb90a1353d-5663ebbd2b8mr1282007e0c.20.1769198507017;
        Fri, 23 Jan 2026 12:01:47 -0800 (PST)
X-Received: by 2002:a05:6122:62b1:b0:55b:305b:4e2d with SMTP id 71dfb90a1353d-5663ebbd2b8mr1281497e0c.20.1769198503280;
        Fri, 23 Jan 2026 12:01:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9faed52sm7868411fa.2.2026.01.23.12.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 12:01:42 -0800 (PST)
Date: Fri, 23 Jan 2026 22:01:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
Message-ID: <gofqva7heojs5d7hi2naihqlpkfttjocdazdg4yjqrkeqew5tw@bp57c7rvycpa>
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
 <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
 <aXHwrnMS2aj_PYRj@hovoldconsulting.com>
 <CACSVV00vk95aYZPrVThoAnHzBUsCHXxnSoEHJNaoLdyJJBOZzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00vk95aYZPrVThoAnHzBUsCHXxnSoEHJNaoLdyJJBOZzw@mail.gmail.com>
X-Proofpoint-GUID: kePkGzkdDIxtfenfVmRjgXOQR8Gwr6PO
X-Proofpoint-ORIG-GUID: kePkGzkdDIxtfenfVmRjgXOQR8Gwr6PO
X-Authority-Analysis: v=2.4 cv=H7TWAuYi c=1 sm=1 tr=0 ts=6973d3ac cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Ifu46aO8IFbR1bL56rwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE1MyBTYWx0ZWRfX/prQNiOju9fp
 9L9IdwRhLHpgCSdVMfqntLS/MNqnm4QwScvyS06FD90nkv0yUwHba8+hU7j6kqD4Prv3BzH2Vna
 TPCJmiuK0mAUjga4lFw5CIO5znEghpWFyGB0l8A3umsjBfSLJF4i9cZ44iA+CebOnSa/Pp5zhq0
 UyiRTFnp7+sM1H5HVRliNgiUX0JMgDMZa1GhSUBPtAXogQgh4ZicuDO6Gxk5NdUqHotxcroTo3Z
 obF8ci11PZfS+t1kbgJ5NWGe9YU4/xLd6s9yKRiSgPaK6WacIQcys7sRiHY8wXRUjhT/ZTd9eJk
 0u0KokI3pyPP9yNDYY9SyK4WWjTCS3+bQp0vnxKPOV2KbGOOg+iayNmoHpke61BxxC6sVAD1HCD
 6PFvYO+yaYUBbEZoQae60WSLyRtievIM+wHJuzw28qAw7tVUGnxgNCF+pqQ4F8MCBHGXjdVTz+C
 vmzg7kBeH/Up24LB8ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90385-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,poorly.run,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 30E147A701
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 06:48:58AM -0800, Rob Clark wrote:
> On Thu, Jan 22, 2026 at 1:41 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > [ +CC: Dave and Simona ]
> >
> > On Wed, Jan 21, 2026 at 08:59:51AM -0800, Rob Clark wrote:
> > > On Wed, Jan 21, 2026 at 7:17 AM Johan Hovold <johan@kernel.org> wrote:
> > > >
> > > > On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > > > > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > > > > The hw clock gating register sequence consists of register value pairs
> > > > > > that are written to the GPU during initialisation.
> > > > > >
> > > > > > The a690 hwcg sequence has two GMU registers in it that used to amount
> > > > > > to random writes in the GPU mapping, but since commit 188db3d7fe66
> > > > > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> > > > > > the updated offsets now lie outside the mapping. This in turn breaks
> > > > > > boot of machines like the Lenovo ThinkPad X13s.
> > > > > >
> > > > > > Note that the updates of these GMU registers is already taken care of
> > > > > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > > > > > properties on a6xx too"), but for some reason these two entries were
> > > > > > left in the table.
> > > > > >
> > > > > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > > > > > Cc: stable@vger.kernel.org  # 6.5
> > > > > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > > > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > > > > ---
> > > > >
> > > > > This one does not seem to have been applied yet despite fixing a
> > > > > critical regression in 6.19-rc1. I guess I could have highlighted that
> > > > > further by also including:
> > > > >
> > > > > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> > > > >
> > > > > I realise some delays are expected around Christmas, but can you please
> > > > > try to get this fix to Linus now that everyone should be back again?
> > > >
> > > > I haven't received any reply so was going to send another reminder, but
> > > > I noticed now that this patch was merged to the msm-next branch last
> > > > week.
> > > >
> > > > Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
> > > > cycle and I would have assumed it should have be merged to msm-fixes.
> > > >
> > > > (MSM) DRM works in mysterious ways, so can someone please confirm that
> > > > this regression fix is heading into mainline for 6.19-final?
> > >
> > > Sorry, mesa 26.0 branchpoint this week so I've not had much time for
> > > kernel for last few weeks and didn't have time for a 2nd msm-fixes PR.
> > > But with fixes/cc tags it should be picked into 6.19.y
> >
> > I'm afraid that's not good enough as this is a *regression* breaking the
> > display completely on machines like the X13s.
> >
> > Regression fixes should go to mainline this cycle since we don't
> > knowingly break users' setups (and force them to debug/bisect when they
> > update to 6.19 while the fix has been available since before Christmas).
> >
> > Can't you just send a PR with this single fix? Otherwise, perhaps Dave
> > or Simona can pick up the fix directly?
> 
> Maybe someone can cherry-pick to drm-misc-fixes?

I know that there is some process for cherry-picking into
drm-misc-fixes, but I think the end result was frowned upon. Neil?

-- 
With best wishes
Dmitry

