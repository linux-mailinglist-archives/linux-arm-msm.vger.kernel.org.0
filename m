Return-Path: <linux-arm-msm+bounces-93524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKqRI4B4mGlrJAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 16:06:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A44C168B19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 16:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 333F03034C76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72FA352F89;
	Fri, 20 Feb 2026 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dITtZ3ML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66CD350A13
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599900; cv=none; b=fwryxZDv6go3RPLFF51dMOYl5fWnfm+cxep7Gtb7wloH19GIfdys6/DRxOgjFjKtf8CTx5cqG7Y++ML85raqWuCG9D1IWTQbgT7TV8+wKVE1YVlrQJoxT7kojony17YdCIIdG2ZIb0LsIf+PxBVczIQ1DDAUzTtbHir59gmGsxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599900; c=relaxed/simple;
	bh=9jg8GSVzhlvl3qb8dOWI3jmEtHVxMEGdCZtEq2GZnQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M27zV4rbt3SbNEPubOLJkd0mn95ELmzseXgo/QESJbFEzfQ5dmOL/EsC78ou2mmCNO3aqlK7fXYwyKMAbvwbUK1zqbVKG07il0nAGHr6OJSUsW+e2LYf8s8vxzP5e3h9UDiXavsOQiCfNGelXomxOYvTEcbZlg3ks5kEy86Zz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dITtZ3ML; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48370174e18so13091205e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 07:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599897; x=1772204697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/Q+u/BKevrrhSPegLhuE2o2bcsUnKPqq9n4o3xsANw=;
        b=dITtZ3MLY4iYz/JssGFRDAOFDNWbaz3QOxZWASDSd3Khe9uHOlRdVU+kNyWrj9LU9F
         TEiU9zSpOcsKUQa4K6IWB1b/iNRjJC1PigzfrDOY0MEt9rt64g9P55i4IZuqw2x/AgAS
         KvBlDIaoP+w7qTwl9eOjUfbZJGsoi4sbZN7gA7msYtS4pi6Bz0M3Y+bMzWaGhyNGvOz9
         pD/r+o2pc0a33MCUuN3H3CUxTkKGXCFX9R47/UqgKnFlX0acmlyJDro0Jg9+mebZ0AVK
         S1lC32C+K7+uTU3NR+KcpkmgUgm6LrRVDwUQlZpvZCwa5vbejJy7mIk6SrRT8LShF6Mz
         4w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599897; x=1772204697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n/Q+u/BKevrrhSPegLhuE2o2bcsUnKPqq9n4o3xsANw=;
        b=Xrl38T/dtFWsFbZv57PXyi/nXPFwO6/3EzivyjOmT+xcn4orp889R7HO/BpsLpkZ3b
         kziwtpXQtqlVehnLvFrzSK5JEdOVzW+ZqHCTUESXqb8dUDnzYxNv8owDWsQw51MgbWKm
         MTujswp0JByxm6cV1JV6sEBLSnpsbgo9ZXX5Pa/UoNdHvfi8ZTrwn8OUKk1Q4gDI84yW
         X8veAID4D3/qo0pXNG58CZ2nRWSBnv19QOHjj6yIqKHZTU3RoSeJLsfqbgbO8nWQcroK
         CzOHLpRcLTqkpAruFtde8TfG3vfiOgKu1tIF0inGl6dR/8EwexuVZS2lwgzCTKEYclt2
         i0CA==
X-Forwarded-Encrypted: i=1; AJvYcCXDzL1GINoqXEBJfdTko5W+OF7EydBI36Z9YPreiRN9MrZgA4GnY0URp7k8XN6uziewwSc/i25Q4DekPpbh@vger.kernel.org
X-Gm-Message-State: AOJu0YzLsjbvE5h4D2YsFmatvI5gnnUUTfaY/VuGCsSfdUcUPNBwRnOR
	b/O6uhl8no0KNKZKV7OzegxE06rnuHvVy6R1isyNw+bvYWVQGZ3oxi11GIIM0nim5qk=
X-Gm-Gg: AZuq6aK6McUvtOdh4fTIsqU/POgulVMN2swVel1r7pneYhMMsk7ImM85FFXlGRsq4do
	odllPbnIHnEvWQrqS85WbrZFzrYkSXAfkdgZLdoeGMlScYj61Dvgl9BMjIqlqu/kFyK3ezD1JM9
	gQzhQSQUb5+ODAyHrpr4DpNAxMS9yqMuy22Ljh9PZ0255c1/Js4oEgKUhqKlEQ8LJB2KoNxRfSe
	0NDc/nv02yNogSOqcqaUXYMT1U2hJAuJHVxi2HTL43H52kt/IUQOowO1dIj/MtxJdzc439YSmiA
	AVgeqHwG+y0f/odzjNClkjXMxTCsONWaD9vnHBgXU7TcdOrr6/Nm1lFQnUizvhaaaZ1UU2H+8fl
	YHSFXzzRqHfotyx3X9jkYdRcNDZ1NAZjOt/wz6MAnF9/Y6KqH7QWsa2BrF0BSS9eAKzSs4ZWwCr
	H6dBbyKtEwk6QsEnHh8o9OO4CWdG1xyvbwD8qHHTqfUn1sz6BIycXoiXQ=
X-Received: by 2002:a05:600c:8189:b0:482:f12f:f35e with SMTP id 5b1f17b1804b1-48379b98ff9mr345118035e9.12.1771599896846;
        Fri, 20 Feb 2026 07:04:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:47 +0100
Subject: [PATCH v5 8/9] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-8-1ad79caa1efa@linaro.org>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9jg8GSVzhlvl3qb8dOWI3jmEtHVxMEGdCZtEq2GZnQ0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgOM8hmvmaTvvuQR/SeDDc3v2JCByWHLeYkZ7J3
 6nYgW0WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4DgAKCRB33NvayMhJ0eM1D/
 wK2zyhgxt57TnS9KxRZ/vtLiPxeGCeglxesbmPQstE5iG5/ApPEhph0HX2/owKkz7E0X9iTR5QUud3
 EFVcEgbCFXwn/iANTjv9t814SiZza8gN+eVwJHXmK1TPbJS/BdfKwGyk8K4xBKW/0lJnux3QyUkQqG
 pcJ5NsqiSmfuDd7BafmjbljFynxfk/fzUefkCiIzAcPO/cCzVjrbfHD4+az0XM+3kya4qG3o/Jk2xA
 hoYkIPEekzaUTsOY5dHpjCNVz8nCwB3Ec+0OYMJT5VirL0K4TpepV2Tsbf5waUufk+alvE1bsXpf60
 tNhVAGGYE2TpJFIQ2Baj/ctxjPVL9KQUfppDHwAqtFDc4MvKq9UEsP40nEXYvT9lb2oN9uHcqkft1K
 F9WZHGDpa+ALL5wnn9HzdNkbkUHhsAgbKa5A/zEa2hJmaDlnjbbFkK2u2A8HDWLDuom0qlUdDj5/ZJ
 qgswAhXVJJRY6BZA4Ib65cg4F5A7zNXzdQCpATIKj3ZtjVitRHu8DzMMexkJFLjNe7kZ3hog/wVnqJ
 WhDK/DUpihOKjp4OQz85w0XjeLXqdG905z3er/z9wTHLIajs7Ea1UTB60l9KgNU92OBIJRI+pxqLbg
 QH1RPphJqG/dsUGQ8lZjGsFvflZwm/EFyFGHmcaKQc+hzqRrbYh6LWD5nNAQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93524-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,af54000:email]
X-Rspamd-Queue-Id: 2A44C168B19
X-Rspamd-Action: no action

Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
controller, need to add dedicated prefix for these mixers to avoid
conflicts and to allow ALSA to properly configure given instance.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 758f87a10d8e..6705922c4d45 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5960,6 +5960,7 @@ mdss_dp0: displayport-controller@af54000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort0";
 
 				status = "disabled";
 

-- 
2.34.1


