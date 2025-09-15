Return-Path: <linux-arm-msm+bounces-73480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7F2B56FF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 084D13A4388
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 05:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AB9275B1B;
	Mon, 15 Sep 2025 05:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFLfLC91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07520E6E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 05:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757915652; cv=none; b=IF7CS5fXp1+ijBfkLhCZ9wZxzAJofKmUXrLtMCNMkpKmrVyBRQDBDo9ogU9GDNfutlyMoS8ml9OUCl1Ac2GQiyK+1nnHUc2379glJnRB6F2zvHOxFZY6PqcN/rX2ia8pKmq3j+/Q6FKb4DY8y94m43M78fZd4DZvFicXCY5Gzco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757915652; c=relaxed/simple;
	bh=kB9Xgjc7sC2n0PUcqqjH03i7/90qjI7OVjgcV04vYa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYwhtz5qEgrZCZJFERXAH2n/ESGqp0vaJtHOoSks+2opzuuA/ZSooPVoTtr3FLdMcNMmJbZXTJaz/IMThF38B8O92jq6UmL2Kfn8v6017tZ1QgOXLdjgpHlFLEWngG8N/MOSNZBFNRmz1bssohr0vOTj7lpwvUuHk6W5+ab+Apc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFLfLC91; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2445806df50so29433415ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 22:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757915651; x=1758520451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xJriz50pVJxCGFehied0kNKF8rdeYvm/MI+kjVAGO0=;
        b=TFLfLC91Nb2w0ASEJe8nX4/7TRx5S7a1oarIFgdCvrouWzojV/7VuzWBOB7K72Xmro
         BJNKXyw8DiJpe9Q6B8GGLAAzlzt63RFQjOV/ZNKRQL9J7CmJJQHI45TyW2/M9n/Dv/jQ
         9PUf1M2S9u5K7F+N14lIYP7CPF4FCAHTEfyW+T7qQNr0CQS4RRNgGPVFu2vw0UzBY5Qs
         FDaZE5eFD2c7XIQN//ULhErfyrApE1iEu1bbJZ+4tNX2unbupZZCyAWGZu2O1M2JGy3C
         mZVvvaUvA6A0QhXSzhR5vGz7MM6V9urrEcRqHQBo+ojqzTNXBgk33u+fhJYxSO/N1B8F
         rpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757915651; x=1758520451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0xJriz50pVJxCGFehied0kNKF8rdeYvm/MI+kjVAGO0=;
        b=SQWkAA2d5AIHYjkOYCY/gohpwokGZAj6fxg7UmZssXSeSWB1qQSEGlW3lxPLcaDY1Y
         h9aP2eVX0n/9shL3iTmQsJyRcYHr6ZOuWBkUnli72xtkumXWVcJf4vqfq9Xwj7+PM9A+
         L0VXxonmhnBHzPLleOIEbibtCMaw1fK5pqA6ebCGsTnTJHC04BflC5nfOaTvcXe0IKS3
         P0pgEk2kuOjTJ6T2WSDv5IxwkL1inifv8TSXHyCw/yYEnw7uu4LqINQ5Ot4SAqkfrSI6
         +sP5CIi96yyBzG8W40DFA2s5XETyI9Hc8JTEPkOGu2iTMewpdvhEmgS4TTcuYhtD9s2u
         KoSg==
X-Forwarded-Encrypted: i=1; AJvYcCV2OtH6Mb1+IfLJqamP+XOAqloguPNn08+JyXeu0MExmXdtr76O27gkVJ8FvxTxFkqlJ3b4MLA34Wj3d9RE@vger.kernel.org
X-Gm-Message-State: AOJu0YwkamXCLX8VIW9jur+ZSUouxQgPKbKbFsjCX9ELIGn3sDFw0bhL
	lTsB8QJDXhNjVWkhheRg4gZDiVoGFR1uZajGOIp7leROBLLNwJkxSfxi
X-Gm-Gg: ASbGncs18D9vhTEEnH0iSziWD3EM+oGDsM2OczoTg1S7tdcNhlSRaKbsHAteFuEilWL
	0Tx5bcHQ0zXyOOuvpD+fMhsHXSu6atiT07uYyDO9lpYe2PGWWzQhOE8cSghiDELwtFEaI1Lb/08
	IsI3D6W44uRQurjM+5+uGxwzA3KCqziDwggWZL6FaHRLHyffyLvimqs+gYAqZV6VnuFFx8FSLe4
	Ad4n9gU2ccGbeqrfR+C5CadKegDpHu5UTARYaGV43gxaIX1vzABVqt1gQ9noRIVW+KOG/cbdKUh
	xxkBzGBqyAjchBnNKKRsZzAB3ZEsOFLW4z3rt3yaT6VhxKG6aMlc+zAjKhHtWuMNxmy5sMWf1xi
	jr6NdVRmZx3hrTGE2oNvs7/kyLwhRuBM/E74ylVxmIuk=
X-Google-Smtp-Source: AGHT+IEJVYaEmuUexNhRqGO7tkehxpSdx8qtkzbg9zsJFEDr0LSZYoc24Ea58IdB11ffQysDsreYOg==
X-Received: by 2002:a17:902:e78b:b0:249:33db:34b with SMTP id d9443c01a7336-25d267641bfmr127285115ad.42.1757915650523;
        Sun, 14 Sep 2025 22:54:10 -0700 (PDT)
Received: from [172.17.44.75] ([49.249.92.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3ae283fdsm116165945ad.107.2025.09.14.22.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 22:54:10 -0700 (PDT)
Message-ID: <ea15d474-dc40-4a58-948d-e8311ca9e2a3@gmail.com>
Date: Mon, 15 Sep 2025 11:24:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: add bindings for QCS615 talos
 evk board
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingweiz@qti.qualcomm.com
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <qq4aak33bn3mqxd2edu6zgkkshby63mmitg7zqkly2rj4c2lh7@4s7sndb7e2jr>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <qq4aak33bn3mqxd2edu6zgkkshby63mmitg7zqkly2rj4c2lh7@4s7sndb7e2jr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/25 19:57, Bjorn Andersson wrote:
> On Tue, Sep 09, 2025 at 06:22:54PM +0530, Sudarshan Shetty wrote:
>> This adds binding support for the QCS615-based talos evk SMARC platform.
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 03a7d3c92ecd..a5dbe6af68ac 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -952,6 +952,12 @@ properties:
>>            - const: qcom,qcs615
>>            - const: qcom,sm6150
>>  
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs615-iq-615-evk
> 
> Can't we make that qcom,talos-evk?
Yes, I’ll rename the board compatible to "qcom,talos-evk" in v2
> 
> Regards,
> Bjorn
> 
>> +          - const: qcom,qcs615
>> +          - const: qcom,sm6150
>> +
>>        - items:
>>            - enum:
>>                - qcom,sa8155p-adp
>> -- 
>> 2.34.1
>>


