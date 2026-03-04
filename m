Return-Path: <linux-arm-msm+bounces-95231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LcnMz13p2kchwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 01:05:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF361F8AB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 01:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E93B7308B997
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 00:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD24D2882C5;
	Wed,  4 Mar 2026 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gEv2ibit"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFED277035
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 00:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582544; cv=none; b=Z7xq1TgUiT68d8LZZu5JUCUnkYisJnaOU0olbcbJxB22aBXt+Eys9e5fxZSLdZ/pTxN/6ZqwSv3uXkS4YleWWJ4TIITisxRp8fqjGlORjtadEQvLzi/0KoiY0Q/WLHl3ynMTf+cUMibonfBwrl9rOTAfsjAzjtNE+6nI5lU7+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582544; c=relaxed/simple;
	bh=+gtpGvpUHd0JfxYPbL7Ag7WdFEyaLo1orHoZcjDRLSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMkO559pySB2daqW3/kFIK+xhQdxx/D9qX0GZeCCN7a1eypJBmKBlbbSeJR2zbP/kHbz20m+b6OeBxAaum3RxZNlOPQMyTwaLFuEiDJviAu2moXqSAA8tD3tfwJ21Hjx9b/XIeMEecE7W8HRaR1n0Okr6GCU8JcbbQiL5G/yvps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gEv2ibit; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48069a48629so66988245e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 16:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772582541; x=1773187341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3A33foWrGV/3pmx7ubiIaObP2mGudnBEt53Evwina6s=;
        b=gEv2ibit1f2fbU9KEdVfRan/5cUB1vb8cJvTAZA7E/42XGxSJPfr78bpQB/7mZSMjZ
         uMky/uBY0bIjaDYxD0nSHg51KaKuaDefwjeTkjquiRenHjMuq1ONx2XEgOC/kzUIFBQS
         Ms/KI8wthv6zc4TcKFnbempDxtFn/ufYxYR9PSI60/eknY4aSH57Jmps3S69qTgLgpuH
         Wwl4V1e/BjJLw7csr0+pEGcWR53c86t57V/RgiAMD2PTSZFSefp2AGAbwJL9HTIpajV8
         f1PQlLwnz4ueAWPHR3PRUctM7qIsMpxtGy3dTCidQZe5ICyiuu7C+Pcb7Ah3YBgpj8N8
         XYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772582541; x=1773187341;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3A33foWrGV/3pmx7ubiIaObP2mGudnBEt53Evwina6s=;
        b=JU0dt2lkTLUXBcQ8Squ0uwmuemhDdjAq3irxTvorVaZE7dVh8l8i/piF4FA8I5GBWV
         Vi05XWT7d5gDtfuGX93N6QhJ5veIaVDaZm1Z2K+cKeK6gUBtMLDY/jW/CDRPjeNRFOR8
         GONROP4NhfNTLDaH9c7fsNdH0rpCF0Fjwv+UzijYjWpHDWcaUxXyWl3u+Fckqz8ZrjHf
         Kig1fgTJLSGWRONkBRCl2S8QHAi0P71cFL/e0sEucgN50FlrSDq7ZA28CLnT3ME9WKHI
         3WgsBG9LHZEQAy2HkeSPKhSlIIZjfEj+Fj9SSltpWCvChNm6ApgOIb+hqLCo4/P7w/7+
         pJKg==
X-Forwarded-Encrypted: i=1; AJvYcCXRs8zzbi9qx7Xs0zap/XPjOB1ndZQOiGXjH04+Js7R0TsM7/c2h1EsK/IP3H5ytPCaJSmWLXz7cv4SfurM@vger.kernel.org
X-Gm-Message-State: AOJu0YxTOmn7ezP8OOvBJsr4KDuXzqGt+qVnO6S02J998t9gynJcVn/Y
	oAgXuuWehrZGtE9000L60EGg8d+mTkdZYL4PjpTaan+c3pLpyelqpgD3FbXFJgX6fUs=
X-Gm-Gg: ATEYQzzV+ndn8VcUvcZDj2a0GRaKS5g+2O61tWsyd2Tqn5q5jnsf/Ke8Bir0Jh8xjhz
	Iaox/IA0wPsEOXXBqm1AGfUZ2M7yevBue3seHEN2YauiwQvwMMtOrtMUU9sFdUzJWxgNOq4Xt8m
	SOIBfOFr8/nVStldLjgWOoHqPvf5i1h/9v59EOfxAw9rROn+GRmbOMeUuZIP9VC8jwN6x/67JnQ
	BSzUT6oJF6Ka3RqwSy3Fixa1n1v9a0RrA9QW2N0uEs9jWP7BkBGnEks5kmfPK1//W/gBDgMxhYP
	tWS5TOoE6vADXPWucq5IMP3FW9b2yVu96LvSclR3JV7lWxG3rJhSLxf0eZeDLyxT9mhDYHlF5ou
	/x7bIgTpBKnfzQ0OP7YOKJ9sz/j5H6Ry3ZcwFrQ/sof564JHff9u73cfzFvfIZyHu9CxDzw/UV1
	1Jql5P+bxbhc7lZ7CRvUJliWPOCHgQ2AJ3rjehZeZboeY6EcKZ8DF05KhxyMv2u/yH
X-Received: by 2002:a05:600c:8105:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-48519840222mr1722765e9.10.1772582541304;
        Tue, 03 Mar 2026 16:02:21 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187ced3bsm11058185e9.8.2026.03.03.16.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 16:02:20 -0800 (PST)
Message-ID: <39828202-9f48-44f9-9f28-574f141e2ee9@linaro.org>
Date: Wed, 4 Mar 2026 00:02:18 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <4pFL6wOeTKUt-Zq4YbjqJdacMgUIPSYJD-4-5DcIMEZ1sM7JsNFYcSv1bd7ZRVOklTsmkEfxM2b6tTflmiECNQ==@protonmail.internalid>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <03b44922-72d5-465b-96e1-97a19655e97d@kernel.org>
 <4440a3a8-7281-4bea-bb84-7a9d19ef7ce9@oss.qualcomm.com>
 <2a1155bd-7dc5-4ed8-b1eb-ddfa483c75ca@oss.qualcomm.com>
 <4fea7117-ebd3-4279-9973-3ac4f2a78835@linaro.org>
 <bfTUflirC2qzMSllq_4qHGr3GL6TJ088yNF4lCBtjCoc1sXqz0KcfYyWuQv6TeRtP6GdpqllNp4ipl4Qax4xwQ==@protonmail.internalid>
 <f031acf1-9a03-42f9-b61f-b6fa6bf9100b@oss.qualcomm.com>
 <dde5f82a-9ff5-4f7c-9ef9-470aad17c9d0@kernel.org>
 <8e7c2036-74de-4f21-8269-8e2b24323753@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8e7c2036-74de-4f21-8269-8e2b24323753@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4DF361F8AB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95231-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 03/03/2026 23:50, Vijay Kumar Tumati wrote:
> Sure, I was just giving an example. I haven't looked a lot into the 
> IPCAT / clock corners of this target particularly. Someone needs to 
> check the clock plan, 

I mean, feel free.

understand which PHYs require which power domains
> and add that in the following OPP table and as for scaling you can use 
> the same RPMH levels for all those power domains. Btw, if you had 
> defined the below OPP table for TOP GDSC, I think that is wrong. It only 
> has two perf states (on and off) and doesn't need OPP scaling. If you 
> look at the Iris driver, they link only the mxc and mmcx power domains 
> to the OPP table using 'PD_FLAG_REQUIRED_OPP, not the GDSCs.
>>
>> +    csiphy_opp_table: opp-table-csiphy {
>> +        compatible = "operating-points-v2";
>> +
>> +        opp-300000000 {
>> +            opp-hz = /bits/ 64 <300000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs_d1>;
>> +        };
>> +
>> +        opp-400000000 {
>> +            opp-hz = /bits/ 64 <400000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>;
>> +        };
>> +
>> +        opp-480000000 {
>> +            opp-hz = /bits/ 64 <480000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>;
>> +        };
>> +    };
>>
>> ---
>> bod 

Yes, we should scale the MX*, that's incorrect.

csiphy_mxc_opp_table: opp-table-csiphy-mxc {
     compatible = "operating-points-v2";

     opp-300000000 {
         opp-hz = /bits/ 64 <300000000>;
         required-opps = <&rpmhpd_opp_low_svs_d1>,
                         <&rpmhpd_opp_low_svs_d1>;
     };

     opp-400000000 {
         opp-hz = /bits/ 64 <400000000>;
         required-opps = <&rpmhpd_opp_low_svs>,
                         <&rpmhpd_opp_low_svs>;
     };

     opp-480000000 {
         opp-hz = /bits/ 64 <480000000>;
         required-opps = <&rpmhpd_opp_low_svs>,
                         <&rpmhpd_opp_low_svs>;
     };
};

csiphy_mxa_opp_table: opp-table-csiphy-mxa {
     compatible = "operating-points-v2";

     opp-300000000 {
         opp-hz = /bits/ 64 <300000000>;
         required-opps = <&rpmhpd_opp_low_svs_d1>,
                         <&rpmhpd_opp_low_svs_d1>;
     };

     opp-400000000 {
         opp-hz = /bits/ 64 <400000000>;
         required-opps = <&rpmhpd_opp_low_svs>,
                         <&rpmhpd_opp_low_svs>;
     };

     opp-480000000 {
         opp-hz = /bits/ 64 <480000000>;
         required-opps = <&rpmhpd_opp_low_svs>,
                         <&rpmhpd_opp_low_svs>;
     };
};

csiphy0: phy@ace4000 {
     power-domains = <&rpmhpd RPMHPD_MXC>,
                     <&rpmhpd RPMHPD_MMCX>;
     operating-points-v2 = <&csiphy_mxc_opp_table>;
     ...
};

csiphy4: phy@acec000 {
     power-domains = <&rpmhpd RPMHPD_MXA>,
                     <&rpmhpd RPMHPD_MMCX>;
     operating-points-v2 = <&csiphy_mxa_opp_table>;
     ...
};

---
bod

