Return-Path: <linux-arm-msm+bounces-94505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDfQHQDkoWmUwwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:35:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D55801BC08D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 494F43055107
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AD836E468;
	Fri, 27 Feb 2026 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSd9z3Xb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKZ8XFHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A5037FF79
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217296; cv=none; b=pdeLFf7UNR6LP0W/69b4Z4gh3a+AfzfC12ZgSOFNW/jmGyCVh6DwdROiJ2OKzZCtpm8UxFVnoGm7QfZxJeoLWgdyHuY5T5sNQgRnI2STJUplYT3562bv+8CYcZy+nsdhsRkHOVYdQ8H/PlAAFQZid1gLJ7cHpw4xiVsps9m9QKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217296; c=relaxed/simple;
	bh=bl7qdYx7SQiFCSladL9pextAT184jszIrRyy/4wRz0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQ2BQ6JTGNRspFIaaWEZ5S+0GhmskkcU+jzpRBURy1LlrCySebVYB8HePJ6x8Q0WhYxcBPMPwm+AbLlWTDxzwcweHgZ1q6TdHqq01zIpM8SVHXw18X0lK78Ad/zkctV021xGcftG8Ud3VWVDg4v8fybagWlzNJTb7qyMOAvxCqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSd9z3Xb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKZ8XFHa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0Kgc1365722
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6haVS/eYpEqKdgXDQM+xM4e3
	rN111AJOPvjFmNUU4uA=; b=YSd9z3XbdA0/o/vaX7meNHc/RW9jd6rJuUPnU0Wc
	gYsrIsf2fFrUQn+jVKbrxfqXR8ABYnwUU6IHa3q2qcAPJb0hOAiaSvquCAUzRw5R
	u51Og6HuVONElhVhlaoF+tqDwXx476793j0gEngU+optdsbsEwZELhoVYIjeYPqe
	itHC7jWpkzeJYpINhWLOHzJK3zfOILu/hDvGP0tWKn5XGMPG+YSmMJySbvo9yHlY
	i5HV3lTupbmGdjibHTvQ+wO3+5DLXRrM4cNneDG/5g4YotvvXd1Io/UNi1746f+o
	7xwzr+o7t+mKRVAx0TunP6n5ASf83Cls/w05nKIp7+6rcQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck9f01hxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:34:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ca3ef536ddso2231191785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772217294; x=1772822094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6haVS/eYpEqKdgXDQM+xM4e3rN111AJOPvjFmNUU4uA=;
        b=eKZ8XFHawErmoCn6Fjy3t2RChqrR60jRR6NDSAZrsPuIEmVU7yS1xZhmGGBccsoGhn
         pWpANv7CxUN/31Cfjt9Pb34+HszYmqdM4FEvQ5Ufpz/jd7G739OcF4zd0jV9YzwJutv+
         8V9+575oWEuFrx9lNcq4aKOAeiOVeTZZDDtOPXTcz6Om+26IHzubFUp7Wr+d89t/63yN
         gDAGacclL0h9PqtiWdm7YXjZcX5X6j2HGcpzICmXLBmW6nZoBY0sGHVAxSW0npDi8Uf2
         DUpGGLGlvbuUs3tjKZNIIhH9TqJApH5WRYcbANORnYMxVVWqD7FH8pP2f8lhj/Hxmy2F
         XXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772217294; x=1772822094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6haVS/eYpEqKdgXDQM+xM4e3rN111AJOPvjFmNUU4uA=;
        b=KIE80iydmNF1yzzYWpFsGph6yk1H2EWZFBSgtnURjli15TRBds/jqrWePlE0d3nklo
         o2A0rclWUpXPVx7xAkJ5MIJVqa14e+Tug+vbgB6sueFCz8CfkMDDzpCfByMQZXyRIKMM
         ZfO8XJHpaHRNGfiVgGE0z3RztA5aJ+F2s2N3YYpCzY27706WKxYg8BC8hpqHP6kMx85O
         WN9eW4Mr84gyu5mhqo7eEUfPjAh/xkq8TXOsgkHIksTcuwz6iY8f+ybdc/7w9R33X+QD
         nIl9W84DLMO2Kq8BQCLanUQ5+ra13glPgZobepY9KPLo026A6OUIcapi14zR4T6Ea+Mo
         pbKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSCDo4yrFE1mBEptMPsQxiIu01RnbIp1dDGS1MlrvhiGUFwUDzdixYvSMkOHQympiQl3+vvw9kcytyHphO@vger.kernel.org
X-Gm-Message-State: AOJu0YwIeHnLI3DrnAy2M/05q3XQzPqwlU81Yh5icYPN+k6QECvhpj0e
	+c/SIdhWnCrP83XYrergG7N9TyiQrDkvfQlzDjjrtIP1iGf5tLnQgsmJOmjYdtXjRBtJQmgl3uY
	vSJU+ju7/EeWGGNx2cyKzmuDAYec05xtNW53b27E8wydkDwGEExwKKgjfpZ1ySaVxxwjW
X-Gm-Gg: ATEYQzyXubpNgI9P9U59+xDj+ErAp0DMYiVHUxWaEpp2nhiboBpVsIBsm2ZdOstVGaK
	pdRrg03C4x8aAVi+2XE8/8XyHIQMWunGeGmycO0tzp+bwlLkxtdOtMdIZTBIQatCKIHD2Ae13kB
	ek6UvMajb6rdlGnDlb+0eQEj7ry6UCTqbVGZtTosDV/X97GZtgJaojnP8g/dAZtwYJSa0/UCRpI
	Kias/E0d7VreEipVEePVP6zLKps5QjehxqoBiIHcvBkxP2EeuOzVLR60uUVU7zuwHd8sVa7EDg7
	I5OH+Y5h+/tTiNv9Tltsp/6Ns31eXusl/XIaqpxbS1TA2TD4ZVUBs7iaWlk/NbZc46D+8VjTxqb
	GBai8KHlHA1I15rqsVcx3KHkB7UaIIuNXTUCc
X-Received: by 2002:a05:620a:2956:b0:8c7:fdc:e872 with SMTP id af79cd13be357-8cbc8d9e73cmr490768485a.19.1772217293705;
        Fri, 27 Feb 2026 10:34:53 -0800 (PST)
X-Received: by 2002:a05:620a:2956:b0:8c7:fdc:e872 with SMTP id af79cd13be357-8cbc8d9e73cmr490763085a.19.1772217293092;
        Fri, 27 Feb 2026 10:34:53 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm256624345e9.9.2026.02.27.10.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:34:52 -0800 (PST)
Date: Fri, 27 Feb 2026 20:34:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] dt-bindings: display: msm: Fix reg ranges and clocks on
 Glymur
Message-ID: <w6rgjozkbhvjbhoiv37ib6hs3ydqnf3zz7app6pziggxitpuo3@3nfmtfqr4ui3>
References: <20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com>
 <177221144530.237949.10314173375793939491.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177221144530.237949.10314173375793939491.robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfX7G7DDt2SwR1W
 DM5I3BqkZlte5FFFmrFcVpglKLj4SBtWgimCWw39X7MCd4LsOyWTL03EG/HljrMU0NXDbRc+7vA
 7y3ZMtLIPq7UlmJ0dBr+WmUQQAjBZg9vhwdSI6D/kGHH3HO+17EnqvgQI/tCW28Yg2SgH3kjBgV
 z/NnWeqmhv9SGk0Pkl/qedbQwHEjUmOnZ5XoiRkHj4uzdGX6BzLKUUvx4ncWH1A0cRjCaCPbhIW
 gKiVwV/VKARBwHlxi2erIbvZ89lA2Gf2XgWiD58Z2s0H/Rp2cDV8rYznqA+v1xDr32Dt+6RRWxy
 sr2WfEVXFNmHXdyBMtBEVK5MbwHNyvqVE4Ks1XJxPY08f+Ei8+dbQzSPgjLWMLol9sbNKN0wvfP
 2gGXZL0IOVQxdL5d+8IYqaCOuoYO7i/Cv6grkbssc2QIKDbUFuK4PYOB4KZK3dnRvzo0DjHYSNM
 2pphRlgJ4hQLhuQdHXg==
X-Proofpoint-GUID: uER8tYlr45nTuod_p7bDyCoBHGF__XHQ
X-Authority-Analysis: v=2.4 cv=bIsb4f+Z c=1 sm=1 tr=0 ts=69a1e3ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: uER8tYlr45nTuod_p7bDyCoBHGF__XHQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94505-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,somainline.org,kernel.org,quicinc.com,oss.qualcomm.com,linux.dev,suse.de,poorly.run,ffwll.ch,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,ae90000:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D55801BC08D
X-Rspamd-Action: no action

On 26-02-27 10:57:25, Rob Herring (Arm) wrote:
> 
> On Fri, 27 Feb 2026 16:23:00 +0200, Abel Vesa wrote:
> > The Glymur platform has four DisplayPort controllers. All the
> > controllers support four streams (MST). However, the first three only
> > have two streams wired up physically to the display subsystem, while the
> > fourth controller has only one stream (SST).
> > 
> > So add a dedicated clause for Glymur compatible to enforce reg ranges to
> > describing all four streams while allowing either one pixel clock, for the
> > third DP controller, or two pixel clocks, for the rest of them.
> > 
> > Cc: stable@vger.kernel.org # v6.19
> > Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.example.dtb: displayport-controller@ae90000 (qcom,glymur-dp): reg: [[183042048, 512], [183042560, 512], [183043072, 1536], [183046144, 1024], [183047168, 1024]] is too short
> 	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml

Yep, I need to fix the qcom,glymur-mdss.yaml as well. Will do in v2.

