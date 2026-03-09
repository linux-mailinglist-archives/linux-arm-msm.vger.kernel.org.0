Return-Path: <linux-arm-msm+bounces-96345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOnpIvUmr2mzOgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:00:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19D240876
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA091311DC8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 19:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C1D411607;
	Mon,  9 Mar 2026 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOzv/ayw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvyXLpSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7A410D27
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 19:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086115; cv=none; b=IWnHltN/cDiH2+BaqlWog3MOt7gQsT+s7xnMqmxX8s1VW3vpNDO0yykqJfpwjWndsEh8l2qa9xr7174r9wClUUdmR36T6ctpQZC4Ka6qHxAbm/AD6uf3q4FVGyhu1kUXg5XNRk0HJti14zMY81YxHW4Xl5Tl75HwlsWWHXGk8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086115; c=relaxed/simple;
	bh=W4MrTBic1HBb9ZZN8z9MrPVPIQYMw2XdIROxl0BHWOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKLJyS3qc/quv8z5SG2mfbpaXDJIdUIUFcIrMzCzxmZB955tLoccQZH/rGEjz4eqkjuRFN/UgL55386YWEq6dIHPdsyPKChafrGv28uqG7L9tVLMYuIe1Aq3p6JHbr1m79VxIM/q8Hs1XQ1p44mBmpBJ6H5ISBGSZRiEamr0oX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOzv/ayw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvyXLpSe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC6wi3280654
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 19:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B9IxQXCxQ9UXI/vzh5L1RtMV
	bGGacONEYx7BpSheQDE=; b=UOzv/aywgzW2EfTCe/ndkr/dIb2B1m0x/XV45O73
	IqAGnL2aL2fBCP/nabJg3s0oDrH/B5pnlM/fDwv4+Nj5Cbp7hmMpIa+M/Wb0jY/m
	I0ZHwgWJCsLt/r7CDximt7OVrOs2qFBOKGMZXiDjpkxgT7e3QUSyXWazv4rqUcZo
	UHG3jjuHbMVjp2CWGXw728P5Oh08QtRfSg9el/ORNS4Pj519cGbH+sRFusFgZzIP
	l+2AsfDNArOiHo+FJaW7kIrOdqGUSBr+QOLJR5EdjHAMm7qziPXI6SMH4dUCC6EI
	MguHLJyuLvXKCdOOrjTofEYn2FR/kdkWR7czvdydrM2urw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcyb1n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 19:55:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81506677so955566585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773086112; x=1773690912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9IxQXCxQ9UXI/vzh5L1RtMVbGGacONEYx7BpSheQDE=;
        b=RvyXLpSeB0itrcyoaDGOESANpMX9+9d12V9f0CsuzU8FifUmhhKZsE80A8gHY2i1cp
         Aw02noeKgWwdhwRQPu7p9Gl8TjvkWA1ZhATrNc5I5/gwZSmt/Mdjlq1FTe3DBAxT5flw
         tia4t8gJSHUTTcpgIu5m04ZFbNhx2TJm2YRiUTmmvVNy0qkm63qwesxqxMwA3Udcg1XE
         DuaTQ4iw43FEF39NErhuFhXESN33uqWoGnehwqbP31Dz8q/0RHpe9nzTvP84Iydm8qsK
         az7YUvGDHBp5m+4FextG4O1Qs5Deh41wkx98n9Tc61cA3eaxx3j2L3i/hfvU4GBRzFHw
         ArTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773086112; x=1773690912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9IxQXCxQ9UXI/vzh5L1RtMVbGGacONEYx7BpSheQDE=;
        b=u5OESpBGefrGcahL5hkosM7SLznkSxihE0jZu3C21trDcpAAekAlpjenBdGaRI07Ai
         BafiD5mOE/C8o+wNndgARzJ9ZKrUAm01l6dRc3b/TWwBCK6yIQR/4acTMPgFkWXJ0Ue+
         gLN2sMMlaJMeg/Wc6qN724o+RjDt+fuEqfAIhjq4ZIFWY7EopHM3UpFPb5PcwY0S4Mwi
         JHoHWF2nkJ2Aby+O1jeJy4Ea2qaRRKyDu5oei5CRXN4vBrK82JXBOpFCBbc4kTz3kPxz
         agghM95tScwgrijstQBZCCBAaWHD7PWwfZJTQ7rNAXEsmIj6b3hV7Wdvv2SToS0O/dwV
         qmpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Zn5MD61ZD4cFsqSN3bSoImI4pK9MV83ZDx2S7yeFIuY042Et5ETwN/qjdVmYAzakkWZ6kFgCyvQp0/ue@vger.kernel.org
X-Gm-Message-State: AOJu0YwPV2YzTwv161E0/WnU29g7yQdFbRSec7isoQmqjWR7eltXYrXV
	XJDikT/CUpohQYh3nJOKfAlb49aBYwkdCp+hNY5rB2LzJAz0uqRrhtVZB6aUabg6/6aes0iKwrA
	m787kd9u18UIzlSbXddGehkGUzI4WoP9/Wwe96Z/0zHhl2guJRVpT6K9M0ZwhwD7B39mO
X-Gm-Gg: ATEYQzzwdNO87p//leCuVTgaxXtXi08KuRCGCbIDIcikZdC9+8mmuSFgeVLwPbEcP6F
	tSU8MZRaysf7IgLDShbSYK79WHTUYEHS0m38KzSnqC2vWngE1W8Yf3OB8A3al3DPPmpErHFa0En
	D/gX+C3sxBzJaBQz8fY2NWxtGF3wBFm1xqSyzK2I9eMjJ+swesgv/vm67/6IOqqBGyqDqK0f/0k
	uFg2UGs1H9sL+P64pV7UdPzdNRHMJFbx6KDDw7rjEM/y1CF7V6q3RTZq9vJ6HHkOkbKqV+4taW4
	oquvjq5R4/j0grce5qHGZc7BY1fNr3pIH4nUewQt2RQiHLMZe0mGxjbiIb5wz7tZFAvZmpY1v0v
	JIzTNBokBfv/McPhcG15MoS0UNSGSsE+XEbAJ3MV+3dit4QteTrEFmTiRVZn/q4S/4SfY9x7kSt
	f5aDTO3K9ccfHuWUfp24N2YcjMe/JnrL7pcbQ=
X-Received: by 2002:a05:620a:4543:b0:8cb:71d4:d0fb with SMTP id af79cd13be357-8cd6d48496emr1526152585a.36.1773086111806;
        Mon, 09 Mar 2026 12:55:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4543:b0:8cb:71d4:d0fb with SMTP id af79cd13be357-8cd6d48496emr1526148185a.36.1773086111226;
        Mon, 09 Mar 2026 12:55:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d0726fbsm1040101fa.41.2026.03.09.12.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:55:10 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:55:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Message-ID: <3ml7bphfd7abn6mat47yagw7l7whv5hia7ifkbh6yi7gdg24j7@2p4sihkcowjd>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3NyBTYWx0ZWRfX70Jeh1ac0Fsd
 E+7/jdcFS1Kg4eSdGj1vyOYP0WfJYS4ysLM9agQANy/HmwaTDM27lJ9poMAgnJV6N8s9cL5+DgJ
 QyQuMMiYpcNp0unmwaTomylFhL6usRxilvMQ0ZMKSJtBekw8tC0zmt8gRRS++LBBHvfSYyN90xT
 fxvQ8K3RBV6ZALSJQS4VjIbcgZ9OAYAl8RhIBIOl40SsWGRLK9nmbX5xh7ZjLKIBX5P0CQhsMAg
 +wFJxIeXHA2ujndzt2o7d7RaKpvO7zIx5gBKjhJj3bkujfJmz7BAG8qWkY6AXq6y38Xv17mHeH7
 b3OTY6O7b/vS6rH0D1hBOQUaPghbz5eB+z7LEHSxQVNXnoX2UIN56IOucq9Js7U4N3wC3QZdwVH
 x4regQK+Olx/EScpL++MkdzrxG5ZwfhIxaHe/G0ZIF0j5KKqS9ueueGhNfKPkFazu+B5NOEWLe1
 9ZVDWPOi7qR8smumGUg==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af25a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=oeFafo8-zzntoLF-tkkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Gm5iyX6AgUnW48-GWdqZoU3L37E_jpEz
X-Proofpoint-GUID: Gm5iyX6AgUnW48-GWdqZoU3L37E_jpEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090177
X-Rspamd-Queue-Id: DE19D240876
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
	TAGGED_FROM(0.00)[bounces-96345-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.16:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
> describe Digital Audio Interface (DAI) child nodes.
> 
> Add #address-cells and #size-cells to allow representation of multiple
> DAI instances as child nodes, and define a dai@<id> pattern to document
> per-DAI properties such as the interface ID and associated clocks.

Is there a physical device being represented by this DAI subnode?

> 
> Qualcomm platforms like talos integrate third-party audio codecs or use
> different external audio paths. These designs often require additional
> configuration such as explicit MI2S MCLK settings for audio to work.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> index 2fb95544d..1d770cbcb 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> @@ -21,6 +21,34 @@ properties:
>    '#sound-dai-cells':
>      const: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +# Digital Audio Interfaces
> +patternProperties:
> +  '^dai@[0-9]+$':
> +    type: object
> +    description:
> +      Q6DSP Digital Audio Interfaces.
> +
> +    properties:
> +      reg:
> +        description:
> +          Digital Audio Interface ID
> +
> +      clocks:
> +        minItems: 1
> +        maxItems: 3
> +
> +      clock-names:
> +        minItems: 1
> +        maxItems: 3
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - '#sound-dai-cells'
> @@ -29,7 +57,18 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> -    dais {
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +
> +    bedais {
>          compatible = "qcom,q6apm-lpass-dais";
>          #sound-dai-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dai@16 {

What is @16 in this case? What kind of address or ID correspondings to
the PRIMARY_MI2S_RX?

> +           reg = <PRIMARY_MI2S_RX>;
> +           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
> +                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +           clock-names = "mclk";
> +        };
>      };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

