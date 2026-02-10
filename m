Return-Path: <linux-arm-msm+bounces-92498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAyJNQQli2mTQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:31:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE4811AD93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4BE63083A66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60484329C74;
	Tue, 10 Feb 2026 12:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXJNpCgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPSKj3tg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F14329361
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726505; cv=none; b=F1vjJV9SDREofjpC9gWOhsZ+oRz9RZBtivINdYJ7YMbA95YL+TV71jOc0jSNys62DXizxJDuYe6jZDeezdXMTFg/vMDapMEcTm4oF9tOmHisY5yCbvZ6LW6cfq2yBoSCU0zI9m/lIrWlBOmNIUosuY7tAxmMDdTsir+rWoVg5Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726505; c=relaxed/simple;
	bh=zxhUhNgv7CtiGH7T3I0KNBO9nYAMyN992iOeA9QvK7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5Acub8cHIvoxE+6KaK3zjeJW59d1KSdexgCWZE6RcB7t7yUt/GXlfddxvXgW7xgaRNNe+FwcAMcM3SUw2Vd5+y0wF506VVwr4aw774Hc2fW/zz8DeXCcDSJIOzzQKSuhBLqEQ/3Azak92BGJDn6pS/eq5z7YKDPMV5Xlw3cFhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXJNpCgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPSKj3tg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Z3aI2169241
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UnhTlIxjfW62WTGpA1O6/UmB
	2s6nfZk9LsddcK1nh7k=; b=WXJNpCgykuagDnnhuTP3Gm+DwatGml2mgURUXd1G
	setFKTrBOD0fVMVYVrdSvVvIn1rQPyOB2m5q1wTyAOD54gs7XzGd6qG2SOwFnw3+
	SxmMytqxzK63DC324E2IXaW/+89CHYn2WT/mwvc5jcnaixoV1HrvKwgu6eSe4n6t
	J/J9Imguzacda/ECNoJ4qnBXnGLeYP2sQy/e3v25b5aSZuS6t3GDblNFhwb0CZpM
	ISolmqRpCouXoz2XpAoFzdocQYn10wHtPj6wCW4JpbcE+uEw6ooOu28aYZQhByVC
	zid/Dj5YUpPvX4pO5wycwFfqdiwimYyjXx/t7P7HGMSWHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drrxeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:28:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ae763d03so79977185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770726502; x=1771331302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UnhTlIxjfW62WTGpA1O6/UmB2s6nfZk9LsddcK1nh7k=;
        b=TPSKj3tg4CwBa5o3DCsgqleyCY/1dFX+1dMpQEXI3ENt3xyMuIJdQUEozYZpNN0qsn
         ATFxnS7hC/h3ld9Kj4vWs02DFvy30QL6t0/sipwIVMVlTP32JhHhxMe6nOwUm+d4yqlB
         GzYaOmYldLXA2EkUHbZ6VMuTLcTyxwLeE2lzlkGlXemLcZ6ZDR9MCJ+qrE/Br8qnM6wk
         7tdsIOvr5dG+4Vnt9++OQDYJkbSXRhK5mXT68LnNC9D+/MmdYSBZzLVrEEXD/dvL7Xgj
         rap4eCDHelWycGWKqO/xZZb2lq0LwDpMdRtK8lErLy+H98AUslDNi7iFQ8EgUHKc8SYz
         oc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770726502; x=1771331302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnhTlIxjfW62WTGpA1O6/UmB2s6nfZk9LsddcK1nh7k=;
        b=hof3KEn3n1mWc5eVpAOjziTvMR712YW6TAkQpDDu2RyYWP2V7dT6BY2d1j77lZBmsb
         FMZljAFTGgfuIWnd94Z5LcHDbszsGYDgiiEEO7bM64Xt4dFofsApmkMV73SqICTKSTgu
         G4RePnqAO/8PI+mi6jhKA1rADfEKgBOhzf7P4e9FV+gnUZSlT0waCYtbc3SBYPVibS4C
         QooG8z7Y0aBa0F5w63ZvLsnwLhF9GoFykNYhUzsZrUX32eVFEd183NczD6VQgzn9fpth
         bSaC3l2q4F5P9iYWMmee5tiKVPma9URXvg11NNrwj3ohc13cfnu/HJFWczCnuJic1EyR
         FWBg==
X-Forwarded-Encrypted: i=1; AJvYcCXE/BCzzpYBWyvySdLwl0HI7azpXQshvoPTH5vteAPntRGZhDrx5CdThGuLCH17llzRPGOaZTp6Z8LLaH1N@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Vur8lhG1xCTUFekchs2mbAJRGBR9jfVeDk9ZW4RiMBiS38th
	Y1hH8nC0AZ5nV17hBEFTHpoK1GNIFC4yczduEPbAaCxDfWkyGmXqYjSdwRl4RArnpGAhmBQf+Dn
	cAqeNh+SDSAx7Ywtfe6rsEwYggnfSRclxvVnkApPv6Nobv/TC0Bxp46k4euUckNn304r+
X-Gm-Gg: AZuq6aLC6kitqhzYWM9vfImeaJhRpl7ae/lUbhzB7KEFzxZKqF4XCzWUWbtgfY8fr7i
	xf1dQsNKO8naeuBOI6ksDcKc6g4hTAPpXVQMgMJzvlLMCzTVTi7wGR4+nLrOLH9J3HWTHElHmUe
	QvQWtEcDYIqgZtaOFfWTPWjuNt4yXy8MFMchyA/2ONaPgYq5LQsXBAks2pmW4Xwt1DUB0d7oD1G
	UCbLyJLKRbMXSs1OMPWf5MoMQ33O5aJfjDdaliUz04iUJMvWuDbqpEIZr9kdoWQOgdMRrE2Uy4R
	Ol9pcOi0lN+fHe9MWia4BKYoiVD0Bo4Hsus1iflCpomWQhnsllwVcxOIL+Loj434KsGYc7GyLUj
	+pcFZbaMwAP245A5FZUp+Dack8mwk0Wm4HHnRzZKP45Vne2ZLCI3RCNqIVO+J/f9fHi70eYWI+c
	m86YAGDlfWUN22GCagorW5M6bdNifi2F4Con8=
X-Received: by 2002:a05:620a:448c:b0:8c6:af59:5e1b with SMTP id af79cd13be357-8caf16ec082mr1824413885a.77.1770726501733;
        Tue, 10 Feb 2026 04:28:21 -0800 (PST)
X-Received: by 2002:a05:620a:448c:b0:8c6:af59:5e1b with SMTP id af79cd13be357-8caf16ec082mr1824409685a.77.1770726501187;
        Tue, 10 Feb 2026 04:28:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b63e8483sm34431931fa.34.2026.02.10.04.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:28:19 -0800 (PST)
Date: Tue, 10 Feb 2026 14:28:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 5/5] power: supply: qcom_battmgr: Add support for
 Glymur and Kaanapali
Message-ID: <esvr4ytgtdrgjg4c47c3adnq7iowzbnoxvlhio2s43dkiuiq5t@l74rp5smkbno>
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
 <20260209204915.1983997-6-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209204915.1983997-6-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNCBTYWx0ZWRfX1Jdi/Nl/qxOC
 dOCFDwKK9MekV50XfXCKAWCGWLNBo6fEq6KbKZ5zBnbWLo+k2VPVuOK871ACPZvvnyK4DOH3s4Y
 axS+mWMfWA8gpcy3n7SqEQpskT2lMwDPRQdQaAXlMUh5fZXX9Y3vYJprfAvUpkvLlzxSHGBLZF7
 Y4hpVQ5pWux57gwQn+qyeLOjgI0RE0eXz5PWleoPvhbr7jgJQ5jEJfUGByDIhsikudWKGZaDukS
 kEAm7cwOIbgL4wuf3qi/0xBYDw/Y42+pGxgaqmRiGXL7882msvgxLeFIyUWAzbTEFlt4Q4m6nZz
 1w78i0CuXLbHM3YrQgSdEp/vk/VPEl+YVvwi0RQV5mQ4fhdAMdD7bfLwoIgrPUCu5YZSdjLzqO2
 WS9V1njCRUQdx+d37/lVfpzcjSHXLTAXcia2AlOqcUvvO2SAWG/ComYhqeZqCpS3jxEZlTYlcqd
 +TH/Sgo7/Vj4KojRxnA==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698b2466 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=kEueVoIVdGDzn9jpcCgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: g0fwWMrQn5yYXLEQ-zdyuoxM_uploW_m
X-Proofpoint-GUID: g0fwWMrQn5yYXLEQ-zdyuoxM_uploW_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92498-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BE4811AD93
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:49:15PM -0800, Anjelique Melendez wrote:
> Glymur is a compute platform which has the same power supply properties
> as X1E80100 and Kaanapali is a mobile platform which has the same power
> supply properties as SM8550. Add support for the Glymur and Kaanapali
> compatible strings.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

