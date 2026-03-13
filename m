Return-Path: <linux-arm-msm+bounces-97635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPibDzxxtGm2oAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 21:19:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD36289AA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 21:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E7763012B40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5653D34B4;
	Fri, 13 Mar 2026 20:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Avivec3X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChSnkGTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAA33D6469
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 20:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433143; cv=none; b=mEQpeqq4SCXPLdDxSKme5Zg22MJFIv+qi+05c33cCf4IcznCWKsf9zPbwMtEwqYnxzGq0eGGlPsv0G6qXsJvZgO+TmwiEpRkLiQf3iV9U90gZIM/uKgi8FQ4gDYW0DiZJLT453J04TY5bh6O9rS6ccCbKDasJedQQgCQRP7ZoRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433143; c=relaxed/simple;
	bh=x1tBXqX0t6boDBDZ9IGrRpy7Jxiv2OC+JkyXvlr155U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gX41V9MyhzN85pc8bBQstxPlJYj4RwioGbyGmdFJ6vXjMXxs9MUWaP/lbPyOdvuFeVvFWxQPqrD/diJzIAD91ROBdQZ3zlkULi6QqQIpYl1/pXGeYtEylvZcJMSUg2aImKRrkpOvWjjaE9Xf0QOJzHPVPOVfkg+E9Yjxet+lpgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Avivec3X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChSnkGTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DIdQWh1753609
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 20:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bkYfD0VrJmDBLlotaNSnR19H
	2w75Eb+WcV9FiDvXvzM=; b=Avivec3XnPpieUxPoQesI3b7X9b4LCpMXXhzRlM1
	NIBQRkLWMLKx6zsnwPFPtSnUwwtlBbqpxxpiu0AHY7oqr4OpYojYCBJUC4xkqBDt
	DfKTPudAYJvG78R5hwfCho0b+IjYH9iZfVkO/pgf6eFEWGyw/kFN+/+Bx7r4SULd
	tfPnLVjWDnPMmrQf9OvHeIrB0oYidgaZzKKyCpJupmAa1ywd2f5EQC22U/YAjIsc
	5RFkJ6+raXSf2DNco3OVtTv9q9zsS3MuItjDMgKCZs0ndzILgKDm/5e2mr+ySkm0
	aHy0dQfaMi2fPTOcnZh38r8R0Aaey3uGvCNGK7SkijDiBA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvr24radu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 20:19:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a0013d87bso404879826d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773433140; x=1774037940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bkYfD0VrJmDBLlotaNSnR19H2w75Eb+WcV9FiDvXvzM=;
        b=ChSnkGTCBUtelJRI5Ce2QYQjrNorG7s96aKxqJmHsHxc+n6D6ml0H9QFWdVpmk7e8v
         shr23677Z8dHLjwSU/hwJOunYNJJF5nZFnW6RyL6ys9203+v6Kj8dn/ZI5x5MlH0GC9v
         pph56hVAXlhdrqxVsIbHzRN8PgBSA6iHd7e+oQdThsa1NV92y/TBaBOy1Cqh5Xq9Jn7j
         UjhBPCMk31DmSB4ekzBUe0AFwDUajOy8LFR/QkEufA8aECa5rW+nm9LJBadCCAaIGixb
         DRjrJYEyRxpZkc85oGk9QgY6vs33dD6lSg+1H3sG6tfpdUKos/M4YV6umwGS5b5ToZO5
         xvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773433140; x=1774037940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkYfD0VrJmDBLlotaNSnR19H2w75Eb+WcV9FiDvXvzM=;
        b=SQ9xmWQz1x1gEmLul68IdRzBJYrwekJvFhKfjhyFBR5X5t9uwKxzh3RVUwJQJo9eZ6
         1rmDLLtZ/Y0fH6cAI9wosmDxO50Fh2uk0jbDuKat2YvroK7oWPNM945KQ+1HRYqqIuWX
         +xzH6be0grVQwM8cF+2pY01863r+fxyhkqCeizlj1XQa1S2q6HnCWPEjuGlCRGIhnIg2
         Yq9W1MpudR5OWWlWZqDeJp/5hR3RljftFnIsJsKzQkL/1T1xwAkOAavjdmXynsfnWOW5
         fYMibCtmu32ZkUUJDddMVqAWDXss0/1pn6YEFk/wG4BkweBgxfi2JbFjX9xNY+ajxbsD
         oMWw==
X-Forwarded-Encrypted: i=1; AJvYcCWpYDi7dRSp3MdDeHtaa0cIXCJvrCKAgvB56EDpAsw42pwJEYtApDYcXKGgJmjOzTibjtniy5OG0cifK4mH@vger.kernel.org
X-Gm-Message-State: AOJu0YwInwe195J6897rFtxSRAoTYqKL3MwqmB3W0hqr9afiT74GEuBZ
	nZt763Y2TC2tn7EaNFN57ZeP/ex36O0XOdyqcdhARDhzQbvT3R5O0b03hpYYfUdmh0W9n/mxZoE
	GBOJTYJUgqTIdseNHUExQZOZrnZfSF+oq+C5P+qNY6fvDtTbIVu7ItcKwd98LVHa9qB3c
X-Gm-Gg: ATEYQzwv2fJDdDgKYBogg0OtZ9yJ4onz9C1OvMJKBZqX2jkK2qrTcNM4zcpzK/ZMagx
	5lA8tK9pLUlngUz94s7FZZYdnCpPkd24I3iOUYq4aLz1dLhM4nSSSj3apBeLjn5p/x26lfcEaIg
	cVzRrFSiz4Ffmoj3XNq69Am87MTTTsvQTG3M148sQRIUdcIy2zZFOadcfQB85bm4pY8FzHkK1h8
	Vj5CLnnHch7ADYIayTsaVvnrHYuZyy080UK/LdF7AqnMmOIherDXvPBCMEqW1FbYdFiq8bC/Zn3
	ubdfrnqqT/KQmajCWzpritGNO8e6MjA3H620cLJMPkB1aLNeBKPDgJCcZCEAvEpTt2HrEleNdJW
	cB1FGokFh7+pPWV3DZ3goeJWg+o/ZAJnaE+tCgIpgigC41Ua0RjnLvT53qioHo4euUg7KxFcK+Q
	08eTuvGgzOEDVNK+Bunt8XhHrbwSIPwyQo6i0=
X-Received: by 2002:a05:620a:1a03:b0:8cd:8889:227 with SMTP id af79cd13be357-8cdb5bdf07cmr661545585a.73.1773433139802;
        Fri, 13 Mar 2026 13:18:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:8cd:8889:227 with SMTP id af79cd13be357-8cdb5bdf07cmr661541185a.73.1773433139184;
        Fri, 13 Mar 2026 13:18:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15603407csm1735734e87.38.2026.03.13.13.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:18:58 -0700 (PDT)
Date: Fri, 13 Mar 2026 22:18:55 +0200
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
Subject: Re: [PATCH v19 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <aim7ktys4pv2pyankykfrm4o7lyh6suqzvahoqsi2u5hrn77pv@zk7zyg6w4hlm>
References: <20260312-msm-next-quad-pipe-split-v19-0-4ffa2b06c996@linaro.org>
 <20260312-msm-next-quad-pipe-split-v19-2-4ffa2b06c996@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-msm-next-quad-pipe-split-v19-2-4ffa2b06c996@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE2MSBTYWx0ZWRfX61P7MuGqeYSR
 ObLcLwwDWASTVlI6vSUMQQwJhMnpnPvaV402yNMWmazRg7H0Yu5LfL0dXzTGzlY1Q6M7LFNtU0U
 MJ2DtWnAovNVi7wFZp1l+9t5WlO9aVfMcJJU6IaXpOApp623uswxlPtWllJdSxldUVMBBZlfdnQ
 uoLA6d3g2LkVksISmhcVa9i7znMcltsqaYOOMwLbaCSTv+ZpGjKbQvtZqmat3mKkIRezKpNaNpc
 mxNzD3BwXTuuVCCg7kqd7ifqK3TWPvB/P6e//C3c4a0TrOW9XwgOwClXXVmwUFEGFHDf84bUbgB
 1Wy333hLSZSxracWyfoIy/25SLoLm+KF1BsbkhBMgeEHahRXaxIFHFR5Krlflm6ohSwCtZhq31j
 Knk6RkQHpmDvGxl73PtZN1IJ6PEDf6whQC9iQhXS5JP/ECh2kbR2ZTzeBRz28IGxgh17jTprgLy
 hIUtFB75K/rvCStNstg==
X-Proofpoint-ORIG-GUID: htbEjAY1xtokEZ3kXJU3T953JgYgUuAO
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69b47134 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TsSR7jEQqzbN-jIPavUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: htbEjAY1xtokEZ3kXJU3T953JgYgUuAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130161
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97635-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAD36289AA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 04:28:11PM +0800, Jun Nie wrote:
> Currently, mapping plane to SSPP occurs during the plane check phase for
> non-virtual plane case. The SSPP allocation and plane mapping occurs during
> CRTC check phase for virtual plane case. Defer these SSPP operations until
> CRTC check stage to unify the 2 cases, and ease later revisement for
> quad-pipe change.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  25 ++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 136 ++++++++++++++----------------
>  2 files changed, 80 insertions(+), 81 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

