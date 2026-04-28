Return-Path: <linux-arm-msm+bounces-105082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DSSGPEb8WnadQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:43:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8BC48BDFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D66D130DF276
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A0D30AD05;
	Tue, 28 Apr 2026 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxuPUb5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqjpCdYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB48A30FF1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408716; cv=none; b=BZyB2TNPheVPX0uWDZWieJpcAZ8KOtxYvytk55N4+1V42AnE1O9gDXIjBjul30m3BLVrJJ73tLkFSqP+5KOrF/odl4anX14gG/7wr8L0x7K+7D6JKzN9SCET4g0vGqi+XNjIacVxpLD0kY8LIhW5MjDnBW/NnkJqdCMFqKtaPf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408716; c=relaxed/simple;
	bh=Vhz/YEl8fzZYz+/Z/DZ8cnbFQ8l6QVcRyVKTTgCKtZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiuYhVt6HzG567DU5hGc7vnsb/wQkBr2lEApv4mL+D8F2BY0sHkdk2xC9ybc58yjoT7ag6L1A7fY6C4KRNopI/ZqV3flUu7LJo8hLPxO0vVrkJg5Bql+9gpfONCIE2KMhjF6kc4PxozBpkYwlBnC7VwihZbChTqaU39zcCQJ0Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxuPUb5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqjpCdYk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsIWU3713178
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qIIMGujOvILN3HT8I/n+2QFM
	OwK60Iic+R2+EUaSQJM=; b=KxuPUb5WSzixO4OYtVfmdZybz/nbwtwm+JrFzqlA
	1iMFHyayoV+unUSS5MTEP0gRhY03nIm70P7lNgFb1V2kzz5oDrbBpbSGqG+GFCW+
	aQ9k8ggDBf6k+eBNnbUsHCrjxrrrAeo7Vz98+1RKwFYt5CBMzOn7I92w3lysZ6sd
	AAJluoM1Eewkz67m86FJ6Eidv4eOe8Il9NZa8ATUW75K9uLYLyvVW+cO33nAbMw/
	vbHkl1hW6gOfrlFu6bzqeDxSBt8eSNEKzXqd3r96IHQOlpZqk45QsBVKaKtM7sIC
	x9pcW5UqyXVUa+AG9Sbr2svoX4rNhywMdiz5jpuKUntAlg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtxb51gmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:38:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e423a05c8so5906841cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777408713; x=1778013513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qIIMGujOvILN3HT8I/n+2QFMOwK60Iic+R2+EUaSQJM=;
        b=LqjpCdYkGMlZBVeOphFLMXC60yvm6Ylx0gCoqpbvmQJ1D92lMd5cQjzvtOMpTUYTu3
         Q9UxzBRYxiLPH5MTrRvFICGKe6hPT2Eve4WmT8xEeR46Q53U3gs5Ikj4uoEVxh5rfRiN
         iprjnB2Yu37cGY/YNqewUMEoF0mYvIJh3nLKOzfR6gYHwKw1Bpb2lYa1KYpwFZ2spqaE
         KfRSOH0Q/1NAIG1AuI9vPjZmMT0HA5RODyEAEwJfcRcxW8GpjClxjuubmNXLX1oQEfGo
         IEGaSYo51rza51Vdt19l1T8NWRTngkgi+l8nd8sPjv7wglb8ohW0yD9+nqZ+84f0fgWo
         aXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408713; x=1778013513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIIMGujOvILN3HT8I/n+2QFMOwK60Iic+R2+EUaSQJM=;
        b=aZE8mbWc1p8++5BWdV/Si73zIjn2/vyxmIxjde8emrQlYSczQJjDixxSlNW6cjkUzO
         jHzM7+bmVgQkTyg0kN3Bg8bMSl32OURRB/jn6ZA3WeBBl2LWTBlA7mzoCbHZpPhGXjdR
         6wRrViYik4xfggJnL+CZAxJ0jvl9Gr5q6kYgV7XvBF7xCg/Jx+y040bINvUzvEOGF7JY
         pvduRFbNl5QRUiqO40f9/mPzUV/I7891+V6Eh0KIdSUrUHtRQTUAwHzGwg1Km50eRYDn
         foZ2PEtlDbSJ+hICgFX19C/vS5kCSM6rk09vG9g4AxiOkYdoQEEj3fIBZTYHaye7HWjn
         rSxg==
X-Forwarded-Encrypted: i=1; AFNElJ+/qjdYkGidHmqb1/zTGRcadwJglcjPzSP+scTc/ODBwibxJQRsSFEwenkjNMgktOOsp5oKG+gXjWY/2QHX@vger.kernel.org
X-Gm-Message-State: AOJu0YxUhGDVeki5gS3FpsUb84SqBc8DKoIHDBaINTkJ7yur9uj0D0Bg
	il2Msc4H8GJBPHdu8M1YativDxKVg0Ob7ZVO8vjACbMNxiSqFO4J9j8eBE+EZ9apv1Bc/dZelq+
	BdvdystGFQHtgppg7fJy9FI5escs4qhHQMZO/yGxFXXww0ujMF5B/paR/4Ui68pCt4vhx
X-Gm-Gg: AeBDietihGfIVpPF5LIaEniUnBWxN1oiYZvkmIsAsXBokoiW2miYSmBWKTz9wYjJN8F
	4TRu70FtspzcJK7XN0R4dC/51aJbzPQMGs5mUlwZXtAiF8Fx8ZQUHwyPSsKg2+yRhfyGjqfVOzw
	Xbo4+WkuATToTV3bdJqwwBPr47tafDcsIXQq5+yHT4AKkOPO89jopKO+B0as17EEXByeb3hLiyj
	rGO6R9UQcistrWDFTi4qCWY/3Pjs+Ubb49Z02AAwHsjTjAdOITgRXqqzdNvpwi+h4jI1lseMXxK
	N12IbjrbEevGWd0CgPlMAyybEbxfkg6x4o2JpHi97aVaCc6Gc8fUpVzS6lSDorfN7dl32lzqgSu
	SIj0JfbXes9L7CmHHw0agF3sD/PrYbip1c9l0kWUOSZsFlDE=
X-Received: by 2002:ac8:5706:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51019a290ecmr8046771cf.10.1777408712962;
        Tue, 28 Apr 2026 13:38:32 -0700 (PDT)
X-Received: by 2002:ac8:5706:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51019a290ecmr8046521cf.10.1777408712562;
        Tue, 28 Apr 2026 13:38:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c57335csm5093135e9.3.2026.04.28.13.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:38:31 -0700 (PDT)
Date: Tue, 28 Apr 2026 23:38:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Message-ID: <dl35jhcdlclpxssnhqbvu6ae4hf6oyqh4rmavul4helgxwrijl@jbqtgv3sva4f>
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDIwMSBTYWx0ZWRfXxMJUJ7+8/ALy
 6ZPrEyaxcNgZc6ODMRRNl8X9drzvY2i4SJGGhW7Po7d9q1im4J46eF0liGHQ7OcdH4B6SL3O5nq
 xrLzQln0GxJNwOKewp1yduskE5ab9t8v2D1/vJkYtWYjeoBwFWGokYKVb3O2OqV+M5CTv9/V8b2
 TnWKyfoOvnQb7FRW5QsDt/E0NEQl1h7nXuEOIHDr6Mw7uheqhauaZrYHc84hnUnCHDDuWut/fzr
 EtIkTLXS/PHvOQs2aIlmz/awb5aRtMnt81DTbLxG3LmvwKogwRrZcWQYZDLS19mZf52rt3BPEIB
 MMc7ZK0g0R4actQl4YcLP7AGjv90UB8G0DSg49yUaqbhz74SJ/FqympoY3v0pdp8rh+SfVXVqqn
 dQEmiKsCAHqgr1a7miCzGCMzceOpPTJUzLdbZA3q0tVnzDLHsxX2eqcfcqK7iF0uFzPFA9+wKyr
 UXdxubP0RrU2KHuEAUw==
X-Proofpoint-ORIG-GUID: A8KU12-huKGdEw_DygCB5Z49qGl80Qol
X-Proofpoint-GUID: A8KU12-huKGdEw_DygCB5Z49qGl80Qol
X-Authority-Analysis: v=2.4 cv=A45c+aWG c=1 sm=1 tr=0 ts=69f11aca cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FQspZMmlHvdRTvJyRkoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280201
X-Rspamd-Queue-Id: AC8BC48BDFB
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-105082-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 26-04-28 22:36:49, Dmitry Baryshkov wrote:
> With the default PSCI suspend value for cluster idle state Lenovo Yoga
> C630 isn't stable enough. For example it might reset if display device
> isn't probed early enough. Drop one of the bits from the PSCI suspend
> value to make C630 work in stable way.

Now I'm curious how you got to this new value.

> 
> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Anyway:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

