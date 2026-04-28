Return-Path: <linux-arm-msm+bounces-105067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GN2zECMD8WmgbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:57:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6C348AED3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D6253042405
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B5447CC87;
	Tue, 28 Apr 2026 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEeHPa7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DeldMT+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBBB32939C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402584; cv=pass; b=HK6uVVpKsIWdz2tQQhwsppqjkPX4u4ihR5Vhp6nxKl0keZdnOgabO4hGzdHM7DHrf72HVu2KlJRlA062xws780FTrKZmsBYIxqYoOlwHUzsfI95BCtFPj0wOUDRwkfF+cJRygXUPmluBJuGUuIdrzwFOCZhrLIDq0JfoPwsNPE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402584; c=relaxed/simple;
	bh=yKuWebngPDM8HW0Nj3aqA+4MhRfylS3ZXpVa/iXF1YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSwcaPb5CIbVfEDfoDxMgfNOdF7YR2efPuHgFycprKL9gl1lIJ9AAhoRSk6DNwEO4jwukLvtmtOQZkDPytEmE7XN4rgmaFQ3HJYKlM+caonkB/zm9KnnivnHk+QoSEUWJ62vG9tKezR68CJQhAGpC3q3OHkNdijW7mBVFHSHnxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEeHPa7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DeldMT+z; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsR9G3705173
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 18:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=; b=lEeHPa7zUwSxOxWP
	sUIKv7wyDQjG80Be//owhNDBJ9XkXQ4r/5URCOhyDSc2OmdK7ySuJYtkkO2bSKnF
	HlbnncYb8BzDOEF9PXeFc3Em9yxN71DXG9cTVonCB8l3zQlZ4jcsvCShd4PNXIds
	j+blEcN85+ND6+cM2iwU1bL25PqU6jyXnuobNJh6u05A9rhPji9QB5eHZVYm42qG
	HhX6ZdpeMYZ0tSVQn69UJ2o7w4zcW5Ku0bzcZrpFV/PeggvyMhOIZECbuFvYYHiL
	8ggHJXYHUqtxKyi1U2Dul0wL8fnhrYhR4Kyl66/6GEieqh+5//bRPO9X1w/gX2vd
	eVqeTg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxha0qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 18:56:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36472c6a7d8so5287732a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777402581; cv=none;
        d=google.com; s=arc-20240605;
        b=LxUfCFPCknEojmmC8JhHduj73Rq4Pbmn/tRemB2IbE6iiSOQiXmpqNqByV65OA0VOO
         tN3Y/R5fBY3f2iuVJNW2M5SJWDoLPg9fNCLDXqBKOO8bHiH7Ks9WGMM4aEAXYfbrn9QR
         sluc7b1CZHcTSWwB8ila55FK7urltxgv24bNI9Cu0OR4r32A1MTE/GHJXKZRuw1uJxHT
         XIQaEMa9v8WX7VjbyQcx8ShWScovNOUWWxNApv5ima9dQGhGTQHHnQ5e6LHplbxqlrqS
         O/ZD7NDowMYptFf1mZKR5YSuzk81FuUOvUVDHwxvwkFBXb3seUWmvqzt42+Eyj+V4u2z
         NgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=;
        fh=x/6mytc6sL7i36Tz2BeqPi7hJjOWrdDldSM7KvaD2dI=;
        b=IKVbO05qqQ3GaoRVZvRfFB2S5Yj5/EwrBPRBX7XAa1aZfguJ9tOUh1ypej0GOhBjIe
         e3xZhG9Nrid5ujNlqrRCxsYK4I8m/ZwIgdGbyJL2P/DDUJMtAnRmUoFn6I6i+bn8qCHq
         u8B/dv9YCB2916KRvS+c4EUeKa5n8XS1yjVzo1VE+OxOVKoWvWgCBIoTUl/SMEn/1dyB
         84h2WJtAt4NsCNIrhKHfZ32cJNBB6b+r16ef7HkTRWF03a1aOFkd41izZ+fTYqRKJUbe
         QFXe03kBw3S5/sd8AlqBHUzimm78yBaUYaf77i0Acur3cpIJKwqB+ZqCyzvVxceD/mdi
         KBew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777402581; x=1778007381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=;
        b=DeldMT+zeW47QDq1AT5ezqbBuJxA9+Ok5Ymm/BGlH0dNXaWGvPBwgLSM2qvXbBYh8Z
         HyBUDhx8SlgyWPY7U7QZ4EDZkqlXCWeMYDugaB21xDwCIYOn7gVGj5cPmq4nm75QnlZf
         H2WppzcvwMaAMTqI894LCfFH5gF1E9fm3tSLargpVJmC1mAohA2Ir0lmoG9PPl6rmsER
         veYf3h0zMCFhMUO9PjfNGAVmTZSv7fHRBQXFEnxHswUquGMtydB5p9FxFAf37ZYMdZy+
         Ibef5v2fjNSTaAGGbMWsuGg6u+iZFxhRrfuLw1Vmfbql8Kd901aE7zK70Rt/nbu+Uxga
         SyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402581; x=1778007381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=;
        b=PvCSKHByoCQRPLgZegkLKmkjZg/8OOWv4RqPYds24+da5LjTEvNcC9bqf8S37Bsqn9
         qlwzT6PMVgB201Tpz45GwFd9PaMMycnWTTXhQ9H0Oo8NHXe/wIyRQspllH2UhVcO91uz
         t3U86IDDYPJ/mpsfwxyefuBlEGfQefoLjGImQbJ9bmHhLz6TddOcqtw9HGvTeZ8X07ct
         tQhGiWPuR+mDDETPejjrBT7Y+9tLYlBF/0EriYHlHopv6uUwe8fprTrEa0NcbjuX2ACE
         NwkbgL9IWIA0rUIb518jNyw3vqmLV0kiAFwcuX/uSOP/nZOMwqfH0xJ/70HaZDPc2TvK
         mT4w==
X-Forwarded-Encrypted: i=1; AFNElJ/qMJYUCuPjp5tPjsJVTKIfIJDCc/1Ek/8lF4L0gNdfN2SDdXDaqbC2fgMFysQZIlhZ8AjpImCY96D8clGJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxjskBytcpRH873XNUQWTkapJoJfxwqRMf9YNA3263eiVjwfv8f
	H4OmT9fs4sbfr/Wp9AgE5uq5iEdomDoWvYvIy3AVJD0ueGDeukn6D6L7rLqsPdJuoLi0qg5PGM/
	MGVSF+63N0Zx8IU43Bvaq/uwaeG+zWYFBWRF55gOZ7KiqTLNlV2x3MifSHz7vIRJlGo3Pbj27Nc
	j2KI08JIdWbNg4/jMawKmEGFARS25Urm8Iw6YAr8Yg9DI=
X-Gm-Gg: AeBDieuWowCq1x6bsMHigGCYh2vMIAG4/PHsACY2BFWPpavZT1cuoSCNt/hwm1+cN/O
	/dNujki/aHjMZS4TIxQxX1BfOkRbDXaQVdFk1gXiBNUKZRS7bFJz1XHrOURf+Vl0U+/L+6HoWFw
	rZK3wZxpmSLYHw/Ig5VIDXt23Wh0d7W8fL9IY0MBK3U+dEXAqBcyURo7ijSb9+7CcymHmhcSXjn
	hwOQd/FbnthAC2nJqlmVSGbdxTm0XkDtjAPR6pncjiRcYpk
X-Received: by 2002:a05:6a21:e097:b0:3a2:7ef4:81e3 with SMTP id adf61e73a8af0-3a39c402e6dmr5239409637.51.1777402581389;
        Tue, 28 Apr 2026 11:56:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:e097:b0:3a2:7ef4:81e3 with SMTP id
 adf61e73a8af0-3a39c402e6dmr5239371637.51.1777402580845; Tue, 28 Apr 2026
 11:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
 <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe> <3938070f-5be7-466c-8967-6dc32b5ef372@oss.qualcomm.com>
In-Reply-To: <3938070f-5be7-466c-8967-6dc32b5ef372@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:56:09 +0300
X-Gm-Features: AVHnY4IbRVOi8SHlF5dYFobt0wvGd_aIyg0c8FWOdUh_XxHFt_x9BmQPJgUIi3U
Message-ID: <CAO9ioeU-B1jpmR5-x=BrWwdTnNRyORKtQ5aShzf7NRFfLfM8MA@mail.gmail.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add display
 CESTA support on SM8750
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE4NCBTYWx0ZWRfXwcNmYTV4Nw67
 SkjMz5j0D9FLcrsbdI6EKUPAnEIOkH9gpoQiVNWZJuvEDNR4ytttsJavWLBamfEL+NLKGKu8CVL
 nN9eXVjK/Dq7ckerIIXg2UVb+8jSgN1hpi4qWciRKb6Yl0cNciGYNyFagCfR/32aeKLq4z0dtx8
 r9kE1yXENL/4SAP+c3QdiBbpwgMdtVQiPWVTobg68b6Pd6MAqAL5tBKZ4dtY5A+x4pmv0i/fhFl
 t9dg7gnsWFvWK9ZTRej23X+TtVA8StzsvGDauO4tN5w9MZBOsL49ixUm5XA6pQ/AUjQIaO4+XEP
 BZtSx3lFJxPE2i3Ox1CnxCxyiF91CJS+gGrB3IaHkOEsW+KUfJhe/IIZ88gIVHxJBCYaygYSqlU
 3+gaIyN25WaF5QpBJcPEsqg3Tb4F41aqjxyuqo9qFXWsl5BCrWCOmysxHe1PcbwB+UKeUElaSkZ
 eCca0IMKsaArz1eQeUA==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f102d6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=gA42fc11l1rYSZANlQgA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ourou8ttAL38YzeWI6oWFFx40cQl6Vji
X-Proofpoint-GUID: ourou8ttAL38YzeWI6oWFFx40cQl6Vji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280184
X-Rspamd-Queue-Id: CF6C348AED3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105067-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]

On Tue, 28 Apr 2026 at 20:21, Jagadeesh Kona
<jagadeesh.kona@oss.qualcomm.com> wrote:
>
>
>
> On 4/20/2026 11:15 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
> >> On SM8750, a subset of DISPCC clocks is controlled by the display CEST=
A
> >> (Client State Aggregator) hardware. These clocks can be scaled to the
> >> desired frequency by sending votes to the display CRM(CESTA Resource
> >> manager) instead of programming DISPCC registers directly.
> >>
> >> Add bindings to allow the DISPCC node to reference the display CRM nod=
e
> >> for sending votes to CESTA hardware and the CRMC syscon regmap node
> >> which is used to read the frequency look up tables provided by CRM and
> >> populate this data in RCG's frequency tables for CESTA controlled cloc=
ks.
> >>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 +++++++++++++=
+++++++++
> >>  1 file changed, 48 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispc=
c.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> >> index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb3=
0b29f0da5c9e156b61 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> >> @@ -60,6 +60,18 @@ properties:
> >>        A phandle to an OPP node describing required MMCX performance p=
oint.
> >>      maxItems: 1
> >>
> >> +  qcom,crm:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      Phandle to the display CRM (CESTA Resource Manager) node, used =
to communicate
> >> +      with the display CESTA (Client State Aggregator) hardware.
> >
> > Is it going to be shared by several entities? If not, can be make a par=
t
> > of the dispcc and get rid of the extra CC <-> CRM API?
> >
>
> Thanks Dmitry for your review.
>
> Yes, clock is one of the consumer of CRM, but CRM can be used by intercon=
nect drivers also
> for BW voting via CESTA.
>
> >> +
> >> +  qcom,crmc-regmap:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      Phandle to the syscon providing the CRMC (CRM clock) regmap use=
d
> >> +      to read frequency LUTs (lookup tables) populated by the CRM.
> >
> > Why is this coming as a syscon? Why isn't it just a register region of
> > the dispcc?
> >
>
> The CRMC block is not part of the DISPCC register region; it is a separat=
e sub=E2=80=91block within the
> CRM(CESTA) address space. It contains clocks frequency lookup tables that=
 the clock driver reads
> to populate RCG frequency tables. Since CRMC block is outside of DISPCC r=
egion and DISPCC driver
> doesn't own or manage the CRMC block and uses it just to read CRM control=
led RCG's frequency
> tables, marked it as a syscon device.

Why is it a syscon rather than a normal device with the normal driver?

--=20
With best wishes
Dmitry

