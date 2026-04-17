Return-Path: <linux-arm-msm+bounces-103573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOpOIfW84mmA9gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:06:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 038CE41F060
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6269D300DED6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 23:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FDC3644D1;
	Fri, 17 Apr 2026 23:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mByWzSFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Owf+DKO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71B61F4C8E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467187; cv=none; b=cArNE43kacGM2mk1Mlf/VdBc/rZNiXhZEQb4YGt3X9av/0lVmLFsNROHYpNHqGkq7u/xY4E04IfNHmRV+hPa5ZNM+HwOi3K1YLrQ4S2+CMlnk8LSLsZRKNS3TW3sECKsyl1WW3VWW0tUTt5bIuv6rAYOVTGyFHsHW0v8fDeMqtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467187; c=relaxed/simple;
	bh=9Z3rkMNYW9rC57WovaqtR7c3iwiDtbCMHKrgHTDkdLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuunWcwDig8rKrHrVnuzySNzWnOIHtohIvOgRCpRprV0TM02M6usSQvtKLNCy51sqpUVK2fvJbSO1H2FDq6e8ufQNqzkGrAg7NVjgEvMh6C5v8oOc1vIVNhiKfb/f3B/mUzvBNsBshM+6ELu1l+tkDE85OJyWykj9WR5D8SO47w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mByWzSFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Owf+DKO+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4jMG2670014
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TH428YEn6ULrJVdAnHLIHUkA
	mePOQLmqHqXMw2uWMJA=; b=mByWzSFaw2EBeSlzjfKxrv4BnxD0ROeFqr0tN4eh
	OJ8DSSnGM7GukrsMUYHSQbuhKTcQ53VX1VY3g6DsbjuwFe1W/5f0WTMZf5PEGzNT
	UdLZKNj8Kv9hlDPNX/ltMd6G6AfmD2tgEgW5uMkJuUx2o/4E9opODlugg5KK9/zl
	VI9dYUfxt0+fgNqxdjFZtfiQfi7oeVikvjGUKoHVGCLKwWLOIouDiNIJqAz+KBvP
	mtEj33FvehXrFWfxKf4ayd6cRLtubTyq8pWI0yzxwwYG4DEkN7hNomxxVjqfZNrd
	d4A2in8DsddCIz+irKU/dz6xavOQ0qh/2WFqgPak048sEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxcv0uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:06:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso29570351cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776467184; x=1777071984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TH428YEn6ULrJVdAnHLIHUkAmePOQLmqHqXMw2uWMJA=;
        b=Owf+DKO+HBqw6DROp+0bDLeQdK27VUBykmcqjiZxFtKOovDjF4lr5QxugjF3QdNQQ6
         yeYBuH6yQH2hz0Ev/DofXjGzvZfquzlqGQz3iS9XDhdQLfDsnkf6ydX0vsmm+GrHY3r4
         kiqxbpWofa3ylMhaCzhfVP7aFs8yd84Yuw33Qa5bl5lHctElxG8AE3kYiEjUx2ktOnR9
         sAcJOqE1UT8QwQ3ja+TTf42QTEw/cIx+eHYLSuYccg0i7Y3V91QqbhCZwFsj/uutcEHC
         VDTsSm9RH/OiXcQ4nFYD6soID8b5Z8/qYRfFdm1XmX3ina+PJyQPnMofxydOLbfBN8NS
         s0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776467184; x=1777071984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH428YEn6ULrJVdAnHLIHUkAmePOQLmqHqXMw2uWMJA=;
        b=ZNRT/eGGILnvlUWTeZAsJaaI3+cxXa96WTFa9xUjSTJAv0Abk6LDA5wZKmYYNq3Ug7
         Na8LWaDE9mOfu/0AppmTTVLgBP7n2ZjEz8IHVN2P+cQF1EH49y9NTT4wU5KRHbm5BKxw
         gCQUnUmyvi8xIHLXgEmLSUo7/PN7XMweBGz3jr+T3/lu7NHdp4TRL+gCztGcI/5S2Yrx
         ADEscSWljI2U95cRff0gWRzhv/DGeG9BRU5vlqYIBTsz1iK/1kWuzAcG0X2MTue4J3iE
         YA8D0TgCC6EzmaWIQ8in++r/4m6WILFE+Co8S1lunIn5or7MWmzXhU9b9g3U7lY7CSVP
         zksg==
X-Forwarded-Encrypted: i=1; AFNElJ/deIxiYoYLIFUUGUEjGqxfLKgkoRHP0G+UJSjQCqltLbBTqJwPBLoAUMABa1tS5x2pon4om7pvM5PenCoB@vger.kernel.org
X-Gm-Message-State: AOJu0YxrrIr9XTup/AkSd6z6E7x/pX/ndGPC8VK9nsbFXwsVDAlQ001D
	beG29Q5rxKsCz497lJJ4s+ecdw3xUWYsDZbIMYv97PtSfTRtnb2ZF0lHFu3KZqqvJSRvXlFs+fP
	6GnTvK+OxSSUqetEcAitSLSS60ADyrpwYg+5qsJhVz3oSBiVv6ONfwkRBeaGoLSpj/NZI
X-Gm-Gg: AeBDietryXaJJNk0yTS3z/g13J8cesAHR04RocjSWhFSkLMms4VJ/mFDmsRJxdzUai6
	EGZgS02nJT11iu8j1HK47mRZHBzXbKODgBifjQv3ughnvgnbfpG51ylYYRrwrx/h4tki0gMCq6e
	NZUKJxPmqHFTLPnK6A3UI2EM6741zwDvEkKSLs4Pq4fPip0tz1tHpylyhGfJUkmX7rvSl/Ivv35
	vpwe8aL0ygzQM71GPx7tdhK5IipzrXTZ03oKHCdskRsHHzUQZkKqNOi5B7qjDGP+A8UvP9SZ67b
	hlRJ3mFVGIOwf4v3gkoyIFPQcLWDYCsgdXBI2kLCZ/xiSlwaxInLNFxeiYLZ1+evtU5AQCTtK3J
	1WZLN4vNkJNF5GsygA8Sf8ULg2yQXrm1Sx2ZYCIsnlfySZg+lo5d8G+XvDYHqHVBcAbR0ymydjC
	JXZbG3tAJJFltWSZS/2r3on+tZ3tbX4sQo6qMJ+u9BeKeNpQ==
X-Received: by 2002:a05:622a:199b:b0:50b:41ec:5e82 with SMTP id d75a77b69052e-50e36b3c5bbmr66950631cf.9.1776467183847;
        Fri, 17 Apr 2026 16:06:23 -0700 (PDT)
X-Received: by 2002:a05:622a:199b:b0:50b:41ec:5e82 with SMTP id d75a77b69052e-50e36b3c5bbmr66950171cf.9.1776467183430;
        Fri, 17 Apr 2026 16:06:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7b22sm788205e87.62.2026.04.17.16.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:06:22 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:06:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Karthik S <karthik.s@qss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Add WCD headset
 playback and record for qcs6490-rb3gen2 industrial mezzanine
Message-ID: <vgrw3n5invft2zxmeh2gsknxvkgluqus4dfb4h2ipea7lvma4k@wrumrkki54s7>
References: <20260417093327.3251203-1-karthik.s@qss.qualcomm.com>
 <b6600312-3667-472b-9b76-c9977355115a@kernel.org>
 <6b24255e-b579-4526-8820-6d7330768c50@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b24255e-b579-4526-8820-6d7330768c50@kernel.org>
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e2bcf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=5rlWakiHEJELYhtiIUoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMSBTYWx0ZWRfX3NRCTSOsU5Oj
 hMO/S8bA9h8u/dO5+TreUKA1bQLpAdkPZvKPTrJ4wNy3mSF85NzLZn9MHrMqr9vAhRDJSJcQFqn
 7oFuXhviewKQZYQQvhuRsYmFvYmlsrqTuUehC//QQl7eq9msKpeQW3HUCgJgNLYbNPM3fYnv7OX
 JI+Dis+ll6T+Bgb3df2NaOYyET+aXnlkTDgVp2x48fKs6wbpWb8zQKGaosrSzKCNOApLXgf5+wk
 nxY3/bhhhLp8zyq7cjeqLR6ubnKO1utaFWRsCwVBEUOLBMlocBpEMXgW3yn7BIX6K+JmsoEkBWC
 ydnvqelw1xeUv0DGJhLnJ9E4QI4anIDsTKeKLPa+YCBwIUb9lK9DpgxEThy7iD8invpdFwT6z0U
 KjmqeIcncRymOKE9l6L1Hmg1yLzHBjIZjAeOsrK0Y9mAjDvDOXCqcoPcRoUR7OwWj07FT59PfN8
 IAHt3/PUfVWgFsXCsFQ==
X-Proofpoint-GUID: MMF8X34ylDGlg8J3lLezgzeS6GTl567G
X-Proofpoint-ORIG-GUID: MMF8X34ylDGlg8J3lLezgzeS6GTl567G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170231
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103573-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 038CE41F060
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 12:12:46PM +0200, Krzysztof Kozlowski wrote:
> On 17/04/2026 11:42, Krzysztof Kozlowski wrote:
> > 
> > And finally:
> > 
> > Please run scripts/checkpatch.pl on the patches and fix reported
> > warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> > patches and (probably) fix more warnings. Some warnings can be ignored,
> > especially from --strict run, but the code here looks like it needs a
> > fix. Feel free to get in touch if the warning is not clear.
> 
> As you pointed correctly after offline talk, checkpatch does not report
> undocumented compatible for the sound card qcs6490-rb3gen2-ia-snd-card.
> 
> Unfortunately this patch did not go through internal toolset fully
> (PatchWise), which could have flag the issue. Let's discuss it
> internally next week.
> 
> > 
> > Undocumented ABI (without any reference in changelog where to find
> > posted patch).
> You still need to solve the undocumented sound card ABI - new
> compatible. If it is already sent to mailing lists, then provide link in
> patch changelog (---).

Which compatible is new there? I think it is a model and not compatible.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

