Return-Path: <linux-arm-msm+bounces-108745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNLMLQSuDWq51QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:50:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2ED58E342
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0357C3036D73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2163DC4C1;
	Wed, 20 May 2026 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xf1JjL31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/UNwXUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026653DA7D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280873; cv=none; b=DAXAeuo5/R9DQwVtvbDctcH8zfqGLa+3HPcAfFehAItv2E18Toz+a0Ag0Fj79Jlj19SyZn8RH2CUQEeRKVFx6oIQRRmobZmpKdv85TqlWED00B339zg2Vv7FpIU2csF5mW1x8FUyL2IhteUsPQs27/0aEjfHSjS7qFqCqJivvBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280873; c=relaxed/simple;
	bh=WKswCxoOQ8jRILBr741XFfschLIhFZABWS7WRA9WPA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYqIntdrjzjRdmlBqy/YqiOCfFhiNp3c0rO5LkhnkHeA/3i03OJ5SMjWw5s8KOJmtrw8LFP9MZdl/2CUJLoMrSIkG0XKGVtwlTX2x2tm6Y68Zdl4kNsdjSHnS5NIAv89XTOIQ6FECUET8i5oPSu92NDl9iioHW3N3Khg3YBzaAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xf1JjL31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/UNwXUU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K74UG81237896
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwsVm+YOh5jnyc4/SA6T4mh8Ap3/phALbTKY3f+nmlg=; b=Xf1JjL31MWue/lap
	J3Ws9trMgWZt8XbPO78iNZlRqn26iOEER487KxS7KsamPJydejXjubIlKlZiPyj5
	d6NnTouIhl6dqnjJvpfhzyZ8Bi7YKEdMzq0DGRahBXKs/P/voFpazjMzKP53enGX
	a9F7MVs8jQ5jIAH24T1u97eqWQ9JjEFdD5xmondmAs4b9Ye4iYajUL2KG3RU03IP
	f4Na1mFim2YJPTgGAVwlcil36Kw7xqx27Py6sGKvjYYAlyqjl9bH0YuytO6aeIVv
	ioOdnXx43qvfl9liAQJWlSQWJL6iquvj4VjjZlJE+zyLbPSfgSutCzdSUyQ3oLhX
	ju0daw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3svtf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:41:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso10456124a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280871; x=1779885671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LwsVm+YOh5jnyc4/SA6T4mh8Ap3/phALbTKY3f+nmlg=;
        b=g/UNwXUUyHUK2HZzreEUHi8UAzPjge1B703fLBs17s1F/52pSd4ZgjsHpdjJBUZxhu
         ZLxralzC/uHSh+EuXqK2mVzQCbOw4bgbNN1fioN07K1duJc04axbJ4G92SzBbpKnz4NZ
         BIgff8jqV8NPAvR6Wt/z/TRH1KTIIsIC71oFhyiZvvNG+Hwz7MtxQAZo7kX8HAjAG1sc
         0KuXw3SlPcSNOMeYTYavPV7eoAYFIRIbLkjINQdS9aQXdhdhd11CgpEXow0Aov8tYO4g
         bvwp39p2HcVo9sMGHl0jkBIa0y3Fh475aNRCXvUe/n2tezPMA2e88Vne9MvVqMmfGc8p
         1Fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280871; x=1779885671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwsVm+YOh5jnyc4/SA6T4mh8Ap3/phALbTKY3f+nmlg=;
        b=F1heKRbkq9v7/td7M7KMOmjF/a9mUC8yG/ePt8xz6Ho3reShNtH+K0Nrb0R1cy3Ckn
         CdB8AMM+rz2j7yR5CQFKwvpt/urrLUq/oqOAbYJL2fFhij/YvOZoC1frW9nEzy1Ra/Zf
         a2jB/oNUWwDzUjcf8SHRkZijvZTjkrLqev5SkaUW1sEhj/GlAttoXQlfY0rpjF9J98bU
         l9++Ebou2xjC7PE20HkjLSPzQ7QoCHWxZ1JlQwtog9RL4Z+FE11g+UkmxCIAu5dZNlTx
         1tXvrdn8/EdR83JUrJeSEjePYyIZw3EHBfbBP2rYO4a07KK706qTnUOPSh6Hy5iTBm2a
         nlVQ==
X-Forwarded-Encrypted: i=1; AFNElJ//6Hl7dNkzcSEUKFbCd7D/w87gU6OAJsTArkqN6zOJbAZ5VecHhwliBVRdjFEZZkH7uL1k+Le/eQ8EzYRD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3nKI+a95Hp/LOzYfwefcGe8MZ9HYaIRjghGELNz5mp4UZQBpm
	xNw0VeWhg1K6ChPP2ud/gBAkA6HDY7wSQbTcCuz07jWrXKF3D3FXQFlt4CSGrCOlhlVyNjZbYLu
	Zk3ABOjRoeTVzGwqnXeDA6wsvA8/SxOCcHaGCgm8NXza3KtEc/NK7us6G1OuY7wGYGlRV
X-Gm-Gg: Acq92OHwbah8NoUVBoS/Yd8o7bNvDX7CBs/bRrfMri0aD77jdhm+h29BTZbrKoiFHrf
	t5Zgg4HU91oqI5MXaYkZIx2OPQSR8iqvwN+UitJ/U+W/8S6YUZUpqKkzhuSOh3kG1H8mQ0JPdfP
	bL67fLqlooOyhDWBTQPH9x+gApYEABp+O317bsyulpT+D5+VTMUHbd+XjJn5sRY21R7fOS28PcQ
	Av25eV6zAsIpYJBRgpAL29c1wqwmncFKLZLUkLiKN+53+UM269KA5YOTou/Z5lSCIqzvdz0ZoMH
	wdla/O6wKn+ygShQ0WMvpKDxwYIFutOEMAsL5zr0ZRMBmU/xRtVhsuAax8of5YJkb/tbVTmSC1X
	YdMgmKUIGsZVhFWeVa0mKJOPzmhh9bnKh7aU50bMfeJaMquu7/5Y=
X-Received: by 2002:a17:90a:51e6:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-369932a2fa4mr10930267a91.6.1779280870557;
        Wed, 20 May 2026 05:41:10 -0700 (PDT)
X-Received: by 2002:a17:90a:51e6:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-369932a2fa4mr10930248a91.6.1779280869950;
        Wed, 20 May 2026 05:41:09 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36968dae27bsm15522213a91.1.2026.05.20.05.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 05:41:09 -0700 (PDT)
Message-ID: <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
Date: Wed, 20 May 2026 18:10:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
To: Krzysztof Kozlowski <krzk@kernel.org>, dmitry.baryshkov@oss.qualcomm.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        rajeevny@qti.qualcomm.com
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <20260519-curly-courageous-sturgeon-2facfe@quoll>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <20260519-curly-courageous-sturgeon-2facfe@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -_dc1C78WNh1ux5-00JyZAblsahVurHm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMiBTYWx0ZWRfX1oHofkRoQTCz
 pQ45AOcdoevnDHhm7+eHrLVpAZYgiR2oZi8UWAkjMYJZEc3FC90mFDnil/OdGva/8NnjaDKftIL
 mixXq21iC6ZmUb34g0bux5atPjAwiQKiDX6UM0wCB+RfrmBjrbWPQKysPcpfv6JELZXfQpNWnuy
 Deg9BcxpYX3M3hmd46W2lYw6qtMjj72nYiwJXGttMBDxdrNGtJl0YZZzCXfmuS864ycmGJ4y9Be
 gBokF7q7P0SaAm6/3gqjTHl3B+o84dMcCbPH31z5F29ejGKcv7+KoS9XcAT9EOpQNq6Z6ByMUh5
 Dq6a2STRkJFwczXMyQAviLv29XSHf/ULKByfq1QDBcGb92+KJ2utZtST20/PRt4NoKKvTGW1L/4
 I06qI/PKO+A43Xizk9wJfeAdFZ0A7OMTmpWvUfHAkss9NIF00WAkhbl0SOLd3Gehzxigx41TLXs
 Ncl0cOy91dcxYrz80jw==
X-Proofpoint-ORIG-GUID: -_dc1C78WNh1ux5-00JyZAblsahVurHm
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0dabe7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=ERuXJlKj0EQyFFk6GMsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200122
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108745-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gitlab.freedesktop.org:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E2ED58E342
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof , Dmitry

On 5/19/2026 4:02 PM, Krzysztof Kozlowski wrote:
> On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
>> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
>> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
>>
>> The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
> 
> If panel requires it, so should the binding.
> 
Ack, I will update.
> ...
> 
>> +  reg:
>> +    maxItems: 1
>> +    description: DSI virtual channel
>> +
>> +  reset-gpios: true
>> +
>> +  backlight-en-gpios:
>> +    description: Backlight enable GPIO (active high)
> 
> What is the name of the pin in ili7807s device?
> 
Display daughter card has WLED driver as well as LCD bias driver.

The WLED driver's Enable is coming from WLED_P1_EN and PWM is coming 
from LCD_CABC output of the panel.

DISPLAY0_BACKLIGHT_ENABLE (GPIO 91) of ITP baseband card ==> WLED_P1_EN 
of Display Daughter Card (DC)

In the display daughter card of Shikra ITP platform, we are not using 
the external PWM for WLED driver. But connected the CABC output of the 
panel to the WLED driver. Backlight update is happening using MIPI DCS 
command which is driving the CABC output (i.e., PWM for WLED).

Because of above HW configuration, we need to enable the MIPI DCS 
brightness update on this panel. The below command of 
dlc0697_init_sequence() is enabling this.
mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);


After checking this, I realized that this panel can be used without the 
DCS backlight as well when it's using PWM based backlight control.

I can add `has_dcs_backlight`  in panel_desc and set it true for 
dlc0697. I will update bindings and add backlight as optional property.

Currently "backlight-en" as optional. I will fix the commit text as 
Krzysztof pointed out and update the commit text to get add more clarity.

please let me know if you have any comments.
>> +
>> +  vddi-supply:
>> +    description: I/O voltage supply (1.8V)
>> +
>> +  avdd-supply:
>> +    description: Positive LCD bias supply (AVDD), typically +5.5V
>> +      (range 4.5V to 6.3V)
>> +
>> +  avee-supply:
>> +    description: Negative LCD bias supply (AVEE), typically -5.5V
>> +      (range -6.3V to -4.5V)
>> +
>> +  port: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
>> +  - vddi-supply
>> +  - avdd-supply
>> +  - avee-supply
>> +  - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    dsi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        panel@0 {
>> +            compatible = "dlc,dlc0697", "ilitek,ili7807s";
>> +            reg = <0>;
>> +
>> +            reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>> +            backlight-en-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>> +
>> +            vddi-supply = <&pm4125_l15>;
>> +            avdd-supply = <&avdd>;
>> +            avee-supply = <&avee>;
>> +
>> +            port {
>> +                panel_in: endpoint {
>> +                    remote-endpoint = <&dsi0_out>;
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 26060e51c067..529aed669401 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7941,6 +7941,13 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
>>   F:	drivers/gpu/drm/bridge/chipone-icn6211.c
>>   
>> +DRM DRIVER FOR ILITEK ILI7807S DSI PANEL
>> +M:	Arpit Saini <arpit.saini@oss.qualcomm.com>
>> +S:	Maintained
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> 
> Drop, unless you handle patches for this driver.
Ack, I will update.
> 
>> +F:	Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
>> +F:	drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
> 
> Drop, no such file at this point.
Ack, I will update.
> 
> Best regards,
> Krzysztof
> 


