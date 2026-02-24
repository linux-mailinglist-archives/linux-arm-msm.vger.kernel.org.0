Return-Path: <linux-arm-msm+bounces-93936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDRqGxZinWksPQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:32:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BAE183B92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C51B301151B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1347536683F;
	Tue, 24 Feb 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAbBfwva";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyxABrLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75DE366831
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771921938; cv=none; b=Wy7azAnwqdf7YkWMmC9pzlx46Qnn1CaDwQQRrVe6GmRLlOUv7TqCIgGySSmcoVGNlYkS13phWsUHiKhL/rg4dkA4H6HCoUSHKWNwoiuJi8JHjbCQoa+8Vn212eYgn9QBmXAK7OPc0RDRG6wxWdhCTG60XrM5Jf9QMsQiZi9aPJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771921938; c=relaxed/simple;
	bh=6RCrh616U7vYgiCSgrgXGgoZWHtvW4U7qcEBUGz0fCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROzmFfNI06vlqKeWsKt5cF/cbeCxe6wGO3oBlAOUJcuM2mzJ3KHD2J9oijWCP1xFogu9eDmyIqXaSTAHoHyTryxgj/pMJJ4dhsgLhGqxf3588jyukXjkG+3rxWVemnV7T1lByKJnOs1UHe/N2ev05Rbf+/KE3t90Xu4RFexTOwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KAbBfwva; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyxABrLF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LgNx694209
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 08:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+HNa961znk3JfzZLWEYNK+x7
	vHC2NAm/Djus3UwnZsg=; b=KAbBfwvalSpRulAeu9ys4zttIx5qGIFPvvMAq6r8
	sm8R6ehZcP6y7jD/ZqRexJIPi3+1y8UcmNRCWtxt0P8Wx8Z8X9cLcfjXJvKjVoeL
	faW9vxVKe3+wUYr4vux8izSF9ct2vOeITtSZwZBFTbrYC8AB1FxW71B2kzpLKC4U
	nEO3TdNWgFGxQHCJuKSTuquZWbprbz7M09qmH0HHkx2G3k8S6wrqu//wM5ovxwQw
	nx6zkmowgFVf71k79Tuy3PcSmvLPEoImRDtW3EuXwwz/9N7K9Z1ETO4vaCNOgzky
	yq28NtNtfmbEV3ZSqd753I775srAac7ma914pBFkssqmgQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9tc2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 08:32:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-894a861fd7cso601003216d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 00:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771921935; x=1772526735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HNa961znk3JfzZLWEYNK+x7vHC2NAm/Djus3UwnZsg=;
        b=HyxABrLF4hfTaODQWUjATC3F1cj9Udtx+sg3BAjHLtwbXU55DTHrFC9SW+R10wpifH
         5G+xUMd9ItGkdJEqVBRNEzxS3rBJYJqd6oYYs2IZPHu0FIWAa42enRX3Jgr9sSFh6REZ
         kFiGxb2d/cXagyxEvs1vUXZk1lyd3VOjs8AmNdAQoVWIkGhUYTMj+0iDbcTbWyK8vM3r
         qvdzeSJxSBGXVcxQpp5CJBqwF+J0IzkrSo1zogxxjrT26I9SLyqSo93bwNi06ilyn0ot
         xcnXC29kgkUvUiZbeWyzcWhY6MiRFDRCADPaloUZsOywCDhRMNV1Vin7m6zTN6zJsKmW
         lT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771921935; x=1772526735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HNa961znk3JfzZLWEYNK+x7vHC2NAm/Djus3UwnZsg=;
        b=l3Pt1HjDBZXdt4k/xU7Me1qySQ1pBITPeLmrXlytEf38dqiBQi1wu4GEPHgM71iu5v
         tOrYF8Cks8cszsP04OkXjbM4SLoCRjeHtXrN4nSgp0WY3/yt5LOJxLEF2ScQVxVEwfCO
         5uuJtGQLJ1blbGP5FfT53haDAyDbcJoHxjXDmVhUCvDWnkuwltsa64Na9FEZN5HYBpNA
         x83dxwpOYj407sg7WhW5ixpE39BezkoLuuU18KBjv8UouuVHbSd0oSzpUO3FjDkXSStQ
         o+UG8i7yUGOWI8UGsXKy/wD1XBju70FYImsRQanRMi/FOj8qoeEygdXMVH/fNM0yYMUD
         96Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUP/4VzcXxvfLo54d6ZbgrMeJDGd5jzhPvTGbHwc01nARBEEha30l5lJL1NlPsj4YraL9oKRKuXBJ6dIwrh@vger.kernel.org
X-Gm-Message-State: AOJu0YyboPKQm2w47raUM8rUPw6yQa/zCtOhgZY063PRGpKZBQSWdAYa
	jIhO10YYkykfH61ao1w+5vlVeAWlBFyEgfEb6a6QcvqIFMB3zaF9eT951WXBj9w0oLfO2hCYz6v
	+DtOADci2DN/0r2k5Cn0snFSkSCPXT1Dw+jOC96e9vKpR/cbYG8O7TQDd9cUigb/CMzmr
X-Gm-Gg: AZuq6aLIMFcN2SbKpDO9noTIu8//fFa6JKi7L4x5+HTk8x0r/u2pPIkGzRoJp6y1O38
	/6Pe6tMG56MFmIGq4fXicszV40Ka4nKDOvYvSZOdN73MVeqwqaBcOnIeum06AfwiLSx1GRCMdFI
	vpGLLPGO5QMDW6fFMJgbHgplEqPg4sAN1AWSaF3+6sw4rKxWlt9TJ0wP88UhRrrD+UPgpnK2frf
	Nl/VGhgAsYN7t5VvqTOLjVjlCvqBgL2w9RAsEgzAR1bzb+Ag18bkYZo3gT27hCnfsHxvBYil2XA
	+9WRcpxzVA6erP9eh7fycKI0l2gfG93TJr9oS5SUEBKkrbnguaL8lcYovSMJqR9WXT9/73jhSNi
	Rc0hhSFUYQmRN6r5TqgWfhCp9c3PrZ3rCqKDg
X-Received: by 2002:a05:620a:c44:b0:8b2:ed29:f15f with SMTP id af79cd13be357-8cb8c9f3a90mr1531724485a.21.1771921934696;
        Tue, 24 Feb 2026 00:32:14 -0800 (PST)
X-Received: by 2002:a05:620a:c44:b0:8b2:ed29:f15f with SMTP id af79cd13be357-8cb8c9f3a90mr1531720485a.21.1771921934106;
        Tue, 24 Feb 2026 00:32:14 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb4bb3sm250878505e9.14.2026.02.24.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 00:32:13 -0800 (PST)
Date: Tue, 24 Feb 2026 10:32:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: OSM L3: Add Eliza OSM L3
 compatible
Message-ID: <jpce3oli4ngfrt7hk33naatjvlhjkr4j7vzo2uf5uux2dswcoi@fs6lspkitpbb>
References: <20260223-eliza-bindings-interconnect-epss-l3-v1-1-fa83970d60ae@oss.qualcomm.com>
 <20260224-hilarious-tasteful-narwhal-c492a5@quoll>
 <2dnws4hpakt4oxhbfpcnu5ga45mmx4fjxexou2gaueiqaveeyn@itiyzldq5cxr>
 <08471da2-8577-4114-ab26-bcbc81536999@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08471da2-8577-4114-ab26-bcbc81536999@kernel.org>
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699d6210 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-5qs52AMC2amogaWbVkA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA3MCBTYWx0ZWRfX01dSJtLaZsm+
 pOhHA3iYmvI8zcV9xEU4yaFck9EddoIDUooGig8hW9+iPA8ugwECE5Kf98FMvz9HH9J5lmoM/vS
 H7yswFXvobULwePD25GKSaA7Dl8WCQOCVX4/eBx+3BOLB85V0nSoj+WxjgywjbKTYZEjHcMV34L
 WITtvTQ5HuK6o0XJ4O3xahZ2FORQjxjIjUqjyvu+ZXQgLdq5+nRHOMz9pse2n/FIT1+Ywu+U7+8
 UbVkIWbBjogXKlRrbv/YLtVesP4qczIYXwyF30d/qwC/vJeZQ0Jalq0j6IujqOSaKmH9ZLSJDgW
 YX+PfqFwe3x/v6Vq6jBSHgk6S0njSjBjmAGKljia3XJ9PUkQqtCMkuEAfkvEAPqEsa/MeYdFjQA
 yaM9ZFpXBM+lsAWW9ot3ARl2rscFV+G80JU9r4kxpvk0Z3rEB5GB84QSf6kpO8prd9Bdlsu5vgo
 KDGJufPjq/duyY0CGWQ==
X-Proofpoint-ORIG-GUID: GOUWeM115tTc_6iGdzSxWYqBgd-hghBt
X-Proofpoint-GUID: GOUWeM115tTc_6iGdzSxWYqBgd-hghBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93936-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4BAE183B92
X-Rspamd-Action: no action

On 26-02-24 09:14:01, Krzysztof Kozlowski wrote:
> On 24/02/2026 09:10, Abel Vesa wrote:
> > On 26-02-24 08:29:09, Krzysztof Kozlowski wrote:
> >> On Mon, Feb 23, 2026 at 10:49:04AM +0200, Abel Vesa wrote:
> >>> Eliza, similarly to SDM845, uses OSM hardware for L3 scaling.
> >>> Document it.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> >>> index 4b9b98fbe8f2..6182599eb3c1 100644
> >>> --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> >>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> >>> @@ -28,6 +28,7 @@ properties:
> >>>            - const: qcom,osm-l3
> >>>        - items:
> >>>            - enum:
> >>> +              - qcom,eliza-epss-l3
> >>
> >> I see EPSS, not OSM here. This is also list without SDM845, so I don't
> >> understand explanation in commit msg at all.
> > 
> > So there are two issues here:
> > 
> > 1. EPSS bindings are handled by the OSM schema. I believe this is by
> > design as they basically do the same thing. Interconnect providers for
> > L3 scaling. So the compatible is in the right schema.
> 
> We do not talk here about schema or bindings at all. Look at your commit
> msg:
> "uses OSM hardware"
> so again: EPSS or OSM.

They are basically the same thing.

Will use EPSS instead in the next respin.

