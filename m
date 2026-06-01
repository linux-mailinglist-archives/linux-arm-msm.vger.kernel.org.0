Return-Path: <linux-arm-msm+bounces-110571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPt1DqltHWrlagkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:31:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60861E59B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23A89300982A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA65346782;
	Mon,  1 Jun 2026 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsZUh8jt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITh9lqgx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0786C2DCC1F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313508; cv=none; b=R3sRIUIzM3GKKfA5xKYgYGWPGinaksBvmKDigP77zTjld/e134A7yQW6IeQIQHHMufp0GQvQ/qGy2KNbvwHgNISZbv8nIqDkb3xzI+a688ocSvo3jmbOrP0vl/okQkZzLUON8j06lTwH3YvJQUiJRyNrxJhvMsQb8SrT5GpqQUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313508; c=relaxed/simple;
	bh=CMCbK4GBOtetUzOVTMPXigvLXYggmTaBv77AMOXmYQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pN8CpsZ4fYccsiDMluL151lPGVtu0mFn6HCcK0tiX9KGyPR57+lTjGaHgkqKWhHRTTF5/cpltxofBqKuVyyjgs/Y2ufSYl1zfkqXnU0Z45oUmakbiRuT2wv/5DJy4mr3MVOPAPgpjPqN7mlVnN09uPcd1aRgcHgEGN3qqrupPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsZUh8jt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITh9lqgx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dsP14111113
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNn3eBFCqh3QzXGSL2O+S+DDaMQWJbT1f9codb+9lr4=; b=JsZUh8jtnEvvs5GW
	jmxTVtxFAf1no+JrbippW/yG5S/T9BCf06BcR6vYLOuYVUCp65jOzR74+Ju3sMBM
	B4/KyB1NXLXfTarY9X7D56ZpeYf7oMgzjT5JRLupYmRp5jUMXB/ybyTERp6h/EGS
	P8xFu9xkGHmoF1tQMbnWBZnjTRMPDNCzSaLPa1RoyZAMSRtEIPU473o8WZgWB89+
	r5HCWy0ecK4xPGwB8eBODTnQLqkRm+1bw0qxALND8Onci0KK6ID8kXwvbaz3HQWN
	qLZz+gV9Y2lYYrcLr5RBo9R1EQd49lDROaVmDHZMgH40tjHC2O8gckT5rtVx9VbJ
	sEnNXQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s3rn8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:31:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59eba324559so629600e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313505; x=1780918305; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KNn3eBFCqh3QzXGSL2O+S+DDaMQWJbT1f9codb+9lr4=;
        b=ITh9lqgxbCua27O9/EObQvnsT/zeJ79Zbo1FTPZ2N3uRyCGZPcp01bhQNAToFftEHS
         pUm+3bWFiq8G+GTzJ7RHID1b2wm3/ySlqW30IXitsG3KBfJXPIHGqtFoUriCv2n4CErV
         90QjImFA9akwJgX3NHZA2Pg42JxsPUSpQUu5C+r7jzS85M7QcnhXA3dIeSp9bBcP4J4B
         h4rAZ0colXgYJBYPdldBknPGF3yrE8fXCadwESzUwvsS075M93+HOEDXNqEfuC2vvywV
         kti5GXAz89JH/WFgeaNHjsM08olFC47V2wLw+ZIOIEuO4/qlH8mKxiGe3g+oTg/jiQWo
         Ivuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313505; x=1780918305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNn3eBFCqh3QzXGSL2O+S+DDaMQWJbT1f9codb+9lr4=;
        b=bGyhZDyRoF4uE5P0hjwjwVN7mapmQ0+FMRskfNSWU9wMgakLBT56YtZcqTbvvYckCD
         PyqEZPVrNoqfCZNwYmYTpL19vsW6J25bUkGUIh6AuXw3Q9DyJWhBwjEaeoxzmLn7OWZF
         CLAH4PIew222AgZ5m+nYHFApkzWmKao4mlwBcyq1gJS7+37AzxLAWRvHTJoQawexN1bD
         gbsSqDOl/1TuMpLUiS1RwgHAxYOkwd9Qy35Bo30pCoJqspY6Jtib1KZF4HKntLY8dyXD
         zW6IoAU25j1QDOYe9EDaWFC8lgD4+cx+mB7xvuZHSMK/wjyC4WrfmILpMtqWbkI9IVad
         /e+w==
X-Forwarded-Encrypted: i=1; AFNElJ+f+ojAcDChrrX2qM8w17kHRNWzrxp6a4R1aRd29X2OREo1oYyngAlps2Il4GN1DeEGCxQL85nW7gemiH5Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwakTbD1/dA1Yl+KA21FIG+OstoC1Mzss6jxYBehBgegJ4/TAMd
	aFa1CwO9V1/dzIHWTZFoHSifaZAVXKeyYBXyULMNJwLlugFQ2v6WwSi1cdt69dXA4BZJAG20vp5
	Ebv3768uqXB5hwZthGx8IxHT3MCTm5T0IOC4G1Q7arnDEGuxajI/8nkRMFJULyF62ATAQ
X-Gm-Gg: Acq92OE82e+2x3OqRijRFZZE2nOf9PMUEX0cp+44UEHZciFJ3FgGhfAqQOjlRjkGcOo
	+34dO1MypU69jcNGevaAct0FeJ//i94BAQYmYyTO176Xy/hfLoNod2xSg+d/c8xmKqSDBcVX7th
	zuIfZiJ0xA69i7a730FMVcxygkOLWz3FLK71R50S0srIU5T/MfKEz3w+6e+ncV1k4kQI4eBgvYg
	b6osY2JTbHxHOlt5DMuQKJXRRawdp+xlztaUuAEG4IFG3gGv68KUN6xKBNpJp9ezOE88JjSJn+2
	8EqC4raVH5O/0on8iuJhtXreinmC5yllYmdhnvXpEqva4XdrFA361TK3/SOVhs027vyWm4bk6Zd
	GtPT62LIIxjqq1s3O3zYCMxLJyfULHQzy163pdKdNuDXkY7Mec849kBTR6HZJ84U9KJ3ZK8xAso
	wSr6AbR5pHODKzjsU/TKh/dar1z6B8yCqnXE1n7UNIjSVAKg==
X-Received: by 2002:a05:6122:3207:b0:575:360e:600a with SMTP id 71dfb90a1353d-59bf1268aa5mr4050641e0c.8.1780313505308;
        Mon, 01 Jun 2026 04:31:45 -0700 (PDT)
X-Received: by 2002:a05:6122:3207:b0:575:360e:600a with SMTP id 71dfb90a1353d-59bf1268aa5mr4050555e0c.8.1780313504812;
        Mon, 01 Jun 2026 04:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07c2e0sm1977344e87.32.2026.06.01.04.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:31:43 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:31:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
Message-ID: <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
 <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AP3YypGC c=1 sm=1 tr=0 ts=6a1d6da2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=rVSrNolec8Lwk94r8HgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfX+0TokHlR93J8
 H9Z6Wksozu3Z6MfjrtFh0LASXCN7jSDPdGoqyWYtUZEXYsD1TU1FR2HW3pZlzW1P0ScigAICYxM
 wcXeUriQgfFFEJ4yNZhnPsMkSXpWBBeEhzBFLVdDe/HIIRcJaaLeaKU0ZJHR0F4g2qYzNgClGPQ
 fvGN9sxG8c+p91LvNTRw9UIuEcwypa6HCAbcQWgIEwX+hzSu6yAS0V7CI3dJ6N6GVMkk1wMkDmK
 FoaVXu2EbqKuxsSDbqN6324QrZaSlwcmse24Za6G2d57aV2UxCFEpMdRR6Q+I8rIpu/W2w3x3dg
 DZXNa9Q6a+CDqj3x1iGHhMk05G8+X620q5nMCYgO+XXb9e2mCsgPthbWPl08aTIe077TZq0/Kw2
 k3nauBIBWovsJ+pT9F05j5B5IDsf7r6FXZpBcJYfzhL5qtwTN0JuMETwNM5ilJtG/bFkJJxMaoG
 09O4RY2Lpz6sF3BjATw==
X-Proofpoint-GUID: 02fkJvfNRN-cE-cTkHz9KV1Jma7Bg5MS
X-Proofpoint-ORIG-GUID: 02fkJvfNRN-cE-cTkHz9KV1Jma7Bg5MS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010116
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110571-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E60861E59B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 04:39:12PM +0530, Nihal Kumar Gupta wrote:
> 
> 
> On 29-05-2026 20:20, Bryan O'Donoghue wrote:
> >>           ret = 16;
> >>           break;
> >>
> > 
> > This is a pointless enum add.
> > 
> > NAK.
> 
> You're right. Since Glymur reuses vfe_res_x1e80100 directly, CAMSS_X1E80100
> already covers it. Will drop the redundant CAMSS_GLYMUR enum in v2.

Is it completely compatible? If so, we can drop the driver parts and
make Glymur fallback to Hamoa.

-- 
With best wishes
Dmitry

