Return-Path: <linux-arm-msm+bounces-99622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMQtMattwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:55:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AD306D55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D13331660F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225A93BE659;
	Tue, 24 Mar 2026 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCjRROio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOZONhOK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69AA3E5560
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349363; cv=none; b=aqLsa2ZyWQQo7Ai7fd/6J0wm0HYZgVuazvGuPh123E/ktWp5/mxB1rWW/349rGtnNmomITsYcDYHtcqbiV2FnY2J03+9gMfJslX0Pat4NZe8/PoMoEHgO1B+vOTf8aRbgpMbI6xzAilfeGsGFI6pujcshsLm1x2sFwTH7FXvF78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349363; c=relaxed/simple;
	bh=IjpnHCeDmjW2Scg1sXPAEhkG9xa772e83xdWC05sYMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=um9Oa6tJYJoWhCJHuUbqX/mqtmx5cuRkK5L4EsRVrg0D8/C91GCBFbwC1rRYUSo2N0rce+jbGrbdrta8KtbapMU5zASmExHIDcsEOfrJD2tq3ma4P6q8+WJ74/JVWMWV3aV6gBFUxHztBPUNls2l2LHiWqaMZ7eio4CQZQqB0mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCjRROio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOZONhOK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7RESG2371490
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0lVPbhuG7aZ6hrbJuahOuRBjUqlqJeG5BCXHtRYeuWE=; b=PCjRROioC//sHb2H
	MVjqUuBH3UJnURQXC/0a85yChIymRAYk6d7ZswgwTL9udZZFGSkAHktssLpoJZ8G
	0v2S2Yy6dtMxqaZn9Q4eybmy0vZwvLdiJko5btL2DIEC/Jbrun7nj+eE3SXmUmK4
	z6gx6ZGjeYNIhX1fURrD3vinzZdHDRh13XasJ+kJOIwjS1VrEQp3XsDtlGe2x5wc
	Ai09wCzhXD6u3f+JHwkp4O0+fCXlWhd6y9TlgBMq6UptOk6i0aQXfyDC8X394MH/
	UFaIPQmwcrqJqUEd3u6yOVQp+o50J3pHGM4sYwjx7EwjTZEKpRc7NX34U3Uwrbnr
	LP4I/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p830qfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:49:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2955cc1eso31683021cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349359; x=1774954159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lVPbhuG7aZ6hrbJuahOuRBjUqlqJeG5BCXHtRYeuWE=;
        b=NOZONhOKILRG3XhsmwcOAHEinNdQUu9J2sUGtwwU8e/Mpf8WCXrFiL5PFnV12pcs+q
         H81Ld59SgNCrvqiry1MdRDEAwe6khbLPrXeCWZJdbU/z1gR9V5e7dz7knrZ/2uDac0z2
         GvWwOUGylb/JVSkC1+gD+O7DchV5z6TVJvKnETy9i0u+FNeQhoaPgv05QL4yebFBdpJ+
         hxhdGNC/HsXmVa14WCQpGm7YYhz4Ia7pFhrJZX6vn6YYKoDq8n9uG0njzUvEHA75PUqz
         cXzj0LEUcsioEZt3WCUOHy3G/ZdQFr8cTd06H3lLxyMmCAEldHRDhtdk+h+k989spYpl
         KMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349359; x=1774954159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lVPbhuG7aZ6hrbJuahOuRBjUqlqJeG5BCXHtRYeuWE=;
        b=pR3eO/FInsrRm4Pnzlmhx0aeL3GLNKF+kYCjPGso3MvHDq5VvshXMkRIA97qbLltHd
         f1i73tuF/pVvSykn7jRhaYnb1RnDXXjdahSd4KWEy8vp6mVTuGMqOJplLNdszJmtpE0E
         H3B0BgnyFStmTinEdTHBsgV/l4cVe2015A480uJQSnNOojePpw/HSGsiQc0CL1jXxVkC
         GVAUXzFEbGOnBBbOQ5A6M4OsFM449VS36+QNO27CO9Ad3PVlaIfJduqoXLncLecZ1l3s
         S3t+JDPiPOrVetbEo39jFyG9MQa2nqOT5hF4z5vqQANhvSs1D4PRt03WJZBO9/WHm33M
         r5oQ==
X-Gm-Message-State: AOJu0Yy33X4p3pPPy1fkrnbw5w2/qZiPUonb8xs4O4eD/cLyuJ+GhyOx
	Mnap09L1qSHlJ/rXQLeJtXWrPLotFc2skk9LOgZilFVKs5UCXaRCZ1nTFOqIaSQB96KpsT6U33A
	WtP4dmtNQzm0mkiQ4cq2xWkDW5jalHeQEGQms3VgZc3SjPemvzgH++MXPSy/sypEImorR
X-Gm-Gg: ATEYQzymY3WMrt+FIxluXj9/TG3pkuwO7KQy3c+TJW0FDfkND4WOK8OFZ7LRRz0pQel
	XpWfojd7bz9+Rl3dHxp7Ky6plYG7y+3FASB/nHi7JpLuNQjmrIrAf0qfDhDvUgM5VHpY7v7G2A/
	il4cgN7PoGLrZo5aW5/a2SUPy1qAv0gozD47Aq0TNPLiIq7t3LWzz0pU7xDTsnaacO8iMeDGQsF
	MMzq3yRoAH09uFvXCfjrGOAZPAJT1/AVhF5zElbEQ87J1P//pGlmXie6F6TjB4jBqeciuxK9s6Y
	UQdxmzqQlxj5VjtwVpdBz2GoG4soFO0UC46svo/NgVQX/XL6j+jEMVy+UfvOW7QQY5tl656L6/x
	4BG3j+SPz51XNcoXtGvJSP9vzpCmdIRkfve9KOi2uZ4YlKiYxu0L/bZ+UsoG377XdDbFpXYSqNg
	RpHfE=
X-Received: by 2002:ac8:7fc4:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50b37425de9mr178260361cf.2.1774349358677;
        Tue, 24 Mar 2026 03:49:18 -0700 (PDT)
X-Received: by 2002:ac8:7fc4:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50b37425de9mr178260011cf.2.1774349358231;
        Tue, 24 Mar 2026 03:49:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871003sm630113066b.54.2026.03.24.03.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:49:17 -0700 (PDT)
Message-ID: <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:49:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes, change path
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX+DMGQf5dE43+
 wpHiifu6HDxzfQxWzxLhDUHLNtbJEG7N1gTvrKQ/gtFvLTj3iwdO6PxOEGblATekJ0N0zajFLyS
 HQGqh95arAADnNXpkJjnK8T42z/tchrfOWknjb18YS/8Wyfo4wDKxzWsVPniokK1BABFcpaRprc
 zLe7ffCxCWoMS50V1N0/oNAJoCm+YlWYHtuEouwQ4xUtt2TrDgkIWEnvSj+6qpPoBM1XvpeT+2G
 U4gJophoLNJ9IPsME3ZF6MHRG+t2YvgdfZSs+aPWzQggTyfMuguABxr8p7c7/VI/Ut9RDHYHYR9
 VZoaNmQcjjCJ80CHav9nQQW3ZxkYxY6SnMSCGAqXvAwLDu0lpcL1+CKJWkLTLvnMBDfnWaNg5LB
 oWrp/g3iooiMliLIWHDoSb+q/vMNujfNapVsl/hpQiYzRSiiqvhkrPPIoaXIli/ID6FYUrNdP24
 lt9qrpVFRHS9YxKrl1g==
X-Proofpoint-ORIG-GUID: iGadcG2tzn4SmJkE0rq_Fz8I3IMKVtLc
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c26c2f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3zMdaVOh9OzsoKMNJxIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: iGadcG2tzn4SmJkE0rq_Fz8I3IMKVtLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	TAGGED_FROM(0.00)[bounces-99622-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 296AD306D55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 3:06 AM, Paul Sajna wrote:
> Add paths for Qualcomm firmware, including:
> ipa, modem, venus, gpu
> 
> GPU and bluetooth are confirmed working, others may need more
> testing/fixes
> 
> But regardless they will need the firmware paths specified here
> and firmware added upstream before they will work, so might as well
> get started on it now.

What about the other board (judyp)?

Konrad

