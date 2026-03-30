Return-Path: <linux-arm-msm+bounces-100895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GDdCHTRymmsAQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:39:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5F8360884
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E8C5302A543
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0A39B495;
	Mon, 30 Mar 2026 19:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9Rs1njb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUrWMDg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DF339A81E
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774899522; cv=none; b=uGEPk6oq5u/USpwPF8x03u7xGwVQ2uvIQLsXLBXW3SR9YB/gzMaHFiie+xxai//GuChy82BuI1ynlGZtkCN0Phg4fLdEBD+2P9alRclne5DDIXoo/XbdA9zJrVDP/KS9d/MhHKvi0PNCp1gO2D91VJnEgSSOXS5EW4+sEwWUNIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774899522; c=relaxed/simple;
	bh=zoDazKR4am3Qud2rzuiXX6B7CUykUfYjPLvMCjP39wA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOW9y1EFfMqFkpUiYO577UQzPRHtQuiXdGTQEDYqoyV59x4+KUMzZKAYZVfaWC5IsNUlsOju3pHn0s2jdyg15deULcLX6CjKfgHRkqRjH7Bq8coomgHFDlXLevqTXE4BmlUi7Jc0kKQ5IGkNCq3pfYa9BlJ8pPBiWUTJfPMVed4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9Rs1njb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUrWMDg6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEDB1a1090270
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gjZmNNPHmNuHOeGribBaDwRd
	i9Pdnrfn8eSrbuTd2d4=; b=I9Rs1njbL10R7SJ9bmaOSCSD9AX0zxFyjrsIUezs
	zIntxRO1qyFeHJo+FPmmHYDta050M1G8gkn6Sgp6ylVvuDRzyRmnh064TQXN1idP
	dgTW997pr5RqlJ98xzZ1Aoeg9bAL192jM+td6Wgz7bgd09ac6c1kuyfiAyeorxp2
	WMtfbmSxklx7vX4EHPYowZVn4WCt7KBbYKgOQASfy3Xs1JEmo5LbAkukLGgG8Sy1
	lkOXDVMeTJydV0wKpsdcRx0RwD/tpQ0+e7ldypunXffosvJ7PYxDCDkbi7hIoJzT
	Yw5lY84tTw6edpBZw6jDClU6DgQKKTMlro1OKy/dO/Lnkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd1ad7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:38:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso65781821cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774899519; x=1775504319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gjZmNNPHmNuHOeGribBaDwRdi9Pdnrfn8eSrbuTd2d4=;
        b=KUrWMDg6nyIL6Lfp+u9imbRqmBJu2SWjjcaAA8pW1ynvLqMcV1vJen+veL60Z3YK2k
         5iHkxVqTnpzCa1kPPT7MSdSyeGvKXocvoKu8vYXRyM/yx4/EYyj6SBS65/nJ3/T3p/Ya
         GU7LH/AbP2fTxu00s5rzm5gv3BEnRwzCcuLmJndb3NBHGbdG8QlWsiFr3WwWrD71z63B
         xkggL5RcDnnGBdQfbQh5m7yPWa10B1FOrQdv2wiZNgoUI/Vy0P0TKJLHgPYJ/m064mKV
         LGHkW/arSgriOmONfQb6CRKIVtNlInPH4LWdkSyQu+wIUotjGV9U/E7k+tO8a8YG0ek5
         6Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899519; x=1775504319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjZmNNPHmNuHOeGribBaDwRdi9Pdnrfn8eSrbuTd2d4=;
        b=nUYsSR4ZCwc8nIOFNBe71m2RBoIrXUk2PGNJjTpj8Y+zNPgIbJRJKvAjjar8lfVJ2k
         nxul3EC1sWIobbSXnATHs5QvFrYnFjmkYbHS1IY9OuYdEW/JbOheLMLJVXapu/tDGpKx
         oq/K1HbAR21yx+3vUqBVybaTKd/BelP12FpvEKOQN7on7s/phFL68RMdlK3+l7d5N9BM
         6ZfYDTKnHe8/KrU7tcvlYHjsms0LVm2KDKpTsVJcxGE+OP1h+rfU0HVMcAX3NXLIe3f2
         v4vH6uRmXxCRNJgJ81iNinTpCdBLID5po+bi3vrVyVbb7ujB2aeLAASPHSNVVQH2qUd8
         BQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCUgmNCDxvX2nCTOup8WfeX10P9vBNKvylQf5q0FIcM81UOPMRiVNxCL3dylyu49giIDbXIKfOUJHCOsOKT4@vger.kernel.org
X-Gm-Message-State: AOJu0YzSG2uUauoUOfUO8KtHDqfoElBDNa0OKt1f4bof8Gj2xrLrvA4E
	xVHK0uZEZXY+YsOUr6VXsLVEOr59IMtYVqaTj1H+jJ2RR8btslt2eSUD12T4W8f+ScPbkB3jU74
	MI9EThnYkFjUC7xRsDspWsadbr8pw8/FAIzZep//DyO5w4w6Gyb4w+krtNXEpmx2DyR3W
X-Gm-Gg: ATEYQzy+ZbDR13VLV3srUoYnjulo3Bme9gW6kC9hrpuxSF7n3QtsFMvD6Nw7k3jfqLl
	Cw+x77t3VsoJ4Pi6airG6w+qQHNlFM1DKJNNM2C9GdbYCUN1JgEyJ0TK9lwqV87Gig9tEB/yDGi
	oWxtakbjg2ZSZr0oqWDqz7gpSWA6ePWkmpXifGJbK6msJyvcpM3gJ7utQfop+HEbr0Uqimqp++E
	v/LEb9Rj5kReP76V1x5nCoUHr/VV9KFbGC54d4WhJOI1EkvTeq9mGoIEPn8DDVdwFw8pn7etiD+
	gQ3rXeE0CvweddACxKjI+a2B8+nBAQ2XE+AHbNjCBT4juujDajzKRe+93m13Xu5oUrhN98iDeKR
	cnCaAHy/4zmujCh3t63V7knn9DGRA+J28Ecet37vPSClDTei2g106xgETcBCEXH7cuRwt62ihR4
	2uKSXhEuCmkErL8M9poE1kkU347myaYXZJoqI=
X-Received: by 2002:a05:622a:1386:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50ba3960fa2mr187521061cf.54.1774899518976;
        Mon, 30 Mar 2026 12:38:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50ba3960fa2mr187520461cf.54.1774899518260;
        Mon, 30 Mar 2026 12:38:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f435bsm1845067e87.9.2026.03.30.12.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:38:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:38:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap
 QMI requests
Message-ID: <zk4b5fq6qlduj4sthdealnfwsb7iphq5wform3mhaij7pcin3a@2dpx4yp3qxyj>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
 <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
 <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
X-Proofpoint-GUID: rwrZn5OmE-aguRO2vYTW_JaikTKkKfnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE2NCBTYWx0ZWRfXw2pMo8+V2YsD
 /DVsQ1WPqvZfZrc7GI4MF+WcmCU5YzGK6lLuHJG8eYNHI38O/d83Q9+Pq5kMLPZUcKlpFhvqyAI
 rR+KgspiWmEEloA4Q/85bNHIHK2df6GU2rboxm+7RTZssK0EnQ0NmhN+CgtiB0Upl0dVZI/c3Yz
 2TFsj7A34TtNDefjsdaj1+sfBqFjFczgW0os/abBNs+l6A8rFzCaaJcwWKk9xRcU3lsFbfkx83b
 WGqacZbhMztGQYy1idu5ij/hm34enwClCxp5EyeSATAzvXM5Gs+0wwNaQPKxy8Tfk+FAjz2UvPs
 vR6HaJC5jJAdMmIl45HqzUxVFgC4rUX1BpR9tBQmS/UQxoTQ8OJ+4nOzqAYuX7ipZR+BBqOE0m0
 dYMhhKqVWzLEOLyM78GwmrnD4h9rSZrDCAEazxz5GsIb4ItavFA6uky86cBLb05I3S53OBkK2jR
 oyG3zLI4G0TsTZzXbZw==
X-Proofpoint-ORIG-GUID: rwrZn5OmE-aguRO2vYTW_JaikTKkKfnb
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cad140 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=RREYq0h8bjQH8LoFo6AA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300164
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100895-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C5F8360884
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 11:56:16AM -0700, Jeff Johnson wrote:
> On 3/29/2026 9:26 AM, Dmitry Baryshkov wrote:
> > On Wed, Mar 25, 2026 at 06:57:16PM +0100, David Heidelberg via B4 Relay wrote:
> >> From: Amit Pundir <amit.pundir@linaro.org>
> >>
> >> Some firmware versions do not support the host capability QMI request.
> >> Since this request occurs before firmware-N.bin and board-M.bin are
> >> loaded, the quirk cannot be expressed in the firmware itself.
> > 
> > 
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > Jeff, to my knowledge this is the best approach that we have to solve
> > the issue on those devices.
> 
> I'm ok with this approach.
> 
> I need DT Review or ACK on the 1/3 patch in order to bring the first 2 patches
> through my ath tree.

Yes, of course.

-- 
With best wishes
Dmitry

