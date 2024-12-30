Return-Path: <linux-arm-msm+bounces-43637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CECF39FE683
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F8963A1616
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE441AAA15;
	Mon, 30 Dec 2024 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bKX0z5kl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6D31AA1D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735565438; cv=none; b=IqAxVW/O+oYUz8g83GIoZgxRraAJ/qvXgd+9C3svECexjqITO1htMV/LB09yayH1jIH/EzluMD4KF5mutWXpEIct6sELSso/F1dDyjNUu6CbsFCAmMTEcFjbbKUa0CghtlcgE1BmgE87VfeXX3E6bFRcuHbZgqu/PXr1hbmMUDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735565438; c=relaxed/simple;
	bh=M6v/yVywOYSdREs9Ma/IF2kj9M/pArXzsHHXPNQpe4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koKbi6C2WwKeCvvPS6gOl2gsrEoyqvk+QD9p99k1MYqBibgpTW2Z3YWst1O7ctuTKLaO+iAmOuZJ/IGhIH2VXpw1GDfDt9udoRl4hfRpyypCgTzaLS0SFul5MqxQ9zkpJWt4xYZyMolo4yyna4Mk0goSkVstlsWCY8j9FUM+UjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bKX0z5kl; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38632b8ae71so6623198f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 05:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735565435; x=1736170235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+HbyAf9hSfisDxRlm9nH3ur/YZXFptsBxBxxyxB/bQ=;
        b=bKX0z5klEKaOPYxXCKT3cMuXOD55FbhVOboOftSxN9Mlo5yAVYNZzYeJSSKoOJLO1B
         WEFE/N5+15NigIg33j9pJLCxarx9C2uKBN/C4xnTggSZBsJENAxY9Iwf1wU0FnpN19or
         IskZAeEmavd1MBMP3kaReGv12UU7gJSrtjW4a/mArmOLjYUtUzmkEaFnqrlSplfDkDDW
         3opsoyoLLNwOCtQVBBAsZbgV6lPs6aZNLEQ+XfylwgXzP5lh2Ptz4Y4YX/u7b4x02Tst
         1Pk9MRenGiu9ZlYmcSZtqOB9MLihl+bvLeRGf/QOPKhCnXMSipwL7iVvMKd3Ma3X5CqD
         yfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735565435; x=1736170235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+HbyAf9hSfisDxRlm9nH3ur/YZXFptsBxBxxyxB/bQ=;
        b=o5NSJ8HzdE/ZLP/caDUyxqFqtIRSUAdyu0taBIDLA6z71Zg1yMGTVjJFlhZ+bztvjF
         1inkZQGb7kAGNj3h1tNl6if6asrNdfhhty9PwR23oKHzj5LoeomTPUDzHPAnDKs//opc
         DLB+NvxVYwCMvQ1qFOloKO4kKeD1ZMLdeSOPIM6wX9YS14PZzwPxvqS6Qsg8izX8AYXo
         KAVaGCUTZGridKbni2EjhQhxUMHdpwkjl49PGmiHy4w/AewEAKvwhubxlJ39zAT8mrYT
         rRN1h5RehkfVGhOQfnGSN0t/XuRSnoAtAFdn/Mmobzwy/jvBoRd296iHCylmGm5UqGDr
         Jhug==
X-Gm-Message-State: AOJu0YyTcZKOzE6FMcvDPbg+dHeUpS/0LoePe3laeXuSyUSay4mGDuBq
	OXtnw5u2FKjJK+/LmDFfnHavzfToeLwcgKkK0Y3JgPrvN5WIQEJG3QuTFoCJEYQ=
X-Gm-Gg: ASbGnct2626hDYCi1Hs7TgOP5WADBSj8JbmNjDh6gsh8KjqsqzI/kZxORRMNmKORXwq
	gUGHuadvE95ccX9aTpf/Shao9VYpZtFrxYdeIEClGSXp+oOT2v/CRyr4rn66QUgqUBBkRepYcgM
	+ynGpAxcKLdrLwL2IrBSJ7gjyDx/RxF491/s0sKgvmVE4xc2tKbom9WSERwYyX1iqPM2/awZtMw
	8doWzVeERmd5u5IM9eZk/OUKIXCqtNFID7jPEu5GWDgXo/4lkZ19ZWOWy+f8068yQ==
X-Google-Smtp-Source: AGHT+IGbde6w1I6UgtuC3oTih3PE68/zI/nzQhw97B5ixtSC72o42J5rCWbDoKaWj3o4sX4ZnXRUSA==
X-Received: by 2002:adf:ab0c:0:b0:386:37f5:99f6 with SMTP id ffacd0b85a97d-38a223ff225mr25512139f8f.53.1735565435022;
        Mon, 30 Dec 2024 05:30:35 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828d39sm31079082f8f.9.2024.12.30.05.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 05:30:34 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 30 Dec 2024 13:30:21 +0000
Subject: [PATCH v9 4/4] clk: qcom: Support attaching GDSCs to multiple
 parents
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-4-f15fb405efa5@linaro.org>
References: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
In-Reply-To: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

When a clock-controller has multiple power-domains we need to attach the
GDSCs provided by the clock-controller to each of the list of power-domains
as power subdomains of each of the power-domains respectively.

GDSCs come in three forms:

1. A GDSC which has no parent GDSC in the controller and no child GDSCs.
2. A GDSC which has no parent GDSC in the controller and has child GDSCs.
3. A child GDSC which derives power from the parent GDSC @ #2.

Cases 1 and 2 are "top-level" GDSCs which depend on the power-domains - the
power-rails attached to the clock-controller to power-on.

When dtsi::power-domains = <> points to a single power-domain, Linux'
platform probe code takes care of hooking up the referenced power-domains
to the clock-controller.

When dtsi::power-domains = <> points to more than one power-domain we must
take responsibility to attach the list of power-domains to our
clock-controller.

An added complexity is that currently gdsc_enable() and gdsc_disable() do
not register the top-level GDSCs as power subdomains of the controller's
power-domains.

This patch makes the subdomain association between whatever list of
top-level GDSCs a clock-controller provides and the power-domain list of
that clock-controller.

What we don't do here is take responsibility to adjust the voltages on
those power-rails when ramping clock frequencies - PLL rates - inside of
the clock-controller.

That voltage adjustment should be performed by operating-point/performance
setpoint code in the driver requesting the new frequency.

There are some questions that it is worth discussing in the commit log:

1. Should there be a hierarchy of power-domains in the clock-controller ?

   In other words if a list of dtsi::power-domains = <pd_a, pd_b, ..>
   should a specific hierarchy be applied by the gdsc code somehow ?

   The short answer is no, you must properly represent power-domain
   dependencies in your dtsi.

   Do this:

   pd_a {
	compat = "qcom, power-domain-a";
        power-domains = <&pd_c>;
   };

   pd_b {
        compat = "qcom, power-domain-b";

   };

   pd_c {
        compat = "qcom, power-domain-c";
   };

   clock-controller {
       compat ="qcom, some-clock-controller";
       power-domains = <&pd_a, &pd_b>;
   }

   Not this:

   pd_a {
	compat = "qcom, power-domain-a";
   };

   pd_b {
        compat = "qcom, power-domain-b";

   };

   pd_c {
        compat = "qcom, power-domain-c";
   };

   clock-controller {
       compat ="qcom, some-clock-controller";
       power-domains = <&pd_c, &pd_a, &pd_b>;
   }

2. Should each GDSC inside a clock-controller be attached to each
   power-domain listed in dtsi::power-domains = <> ?

   In other words should child GDSCs attach to the power-domain list.

   The answer to this is no. GDSCs which are children of a GDSC within a
   clock-controller need only attach to the parent GDSC.

   With a single power-domain or a list of power-domains either way only
   the parent/top-level GDSC needs to be a subdomain of the input
   dtsi::power-domains = <>.

3. Should top-level GDSCs inside the clock-controller attach to each
   power-domain in the clock-controller.

   Yes a GDSC that has no parent GDSC inside of the clock-controller has an
   inferred dependency on the power-domains powering the clock-controller.

4. Performance states
   Right now the best information we have is that performance states should
   be applied to a power-domain list equally.

   Future implementations may have more detail to differentiate the option
   to vote for different voltages on different power-domains when setting
   clock frequencies.

   Either way setting the performance state of the power-domains for the
   clock-controller should be represented by operating-point code in the
   hardware driver which depends on the clocks not in the
   gdsc_enable()/gdsc_disable() path.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c |  1 +
 drivers/clk/qcom/gdsc.c   | 35 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h   |  1 +
 3 files changed, 37 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index b79e6a73b53a4113ca324d102d7be5504a9fe85e..9e3380fd718198c9fe63d7361615a91c3ecb3d60 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -323,6 +323,7 @@ int qcom_cc_really_probe(struct device *dev,
 		scd->dev = dev;
 		scd->scs = desc->gdscs;
 		scd->num = desc->num_gdscs;
+		scd->pd_list = cc->pd_list;
 		ret = gdsc_register(scd, &reset->rcdev, regmap);
 		if (ret)
 			return ret;
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fdedf6dfe7b90c074b200353fc0c2b897863c79f..7687661491f1fd5a3076c839c4f70f430783fc51 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -506,6 +506,36 @@ static int gdsc_init(struct gdsc *sc)
 	return ret;
 }
 
+static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
+				   struct generic_pm_domain *subdomain)
+{
+	int i, ret;
+
+	for (i = 0; i < pd_list->num_pds; i++) {
+		struct device *dev = pd_list->pd_devs[i];
+		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+
+		ret = pm_genpd_add_subdomain(genpd, subdomain);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void gdsc_remove_subdomain_list(struct dev_pm_domain_list *pd_list,
+				       struct generic_pm_domain *subdomain)
+{
+	int i;
+
+	for (i = 0; i < pd_list->num_pds; i++) {
+		struct device *dev = pd_list->pd_devs[i];
+		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+
+		pm_genpd_remove_subdomain(genpd, subdomain);
+	}
+}
+
 static void gdsc_pm_subdomain_remove(struct gdsc_desc *desc, size_t num)
 {
 	struct device *dev = desc->dev;
@@ -520,6 +550,8 @@ static void gdsc_pm_subdomain_remove(struct gdsc_desc *desc, size_t num)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
 			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		else if (desc->pd_list)
+			gdsc_remove_subdomain_list(desc->pd_list, &scs[i]->pd);
 	}
 }
 
@@ -575,6 +607,9 @@ int gdsc_register(struct gdsc_desc *desc,
 			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
 			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		else if (desc->pd_list)
+			ret = gdsc_add_subdomain_list(desc->pd_list, &scs[i]->pd);
+
 		if (ret)
 			goto err_pm_subdomain_remove;
 	}
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..dd843e86c05b2f30e6d9e978681580016333839d 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -80,6 +80,7 @@ struct gdsc_desc {
 	struct device *dev;
 	struct gdsc **scs;
 	size_t num;
+	struct dev_pm_domain_list *pd_list;
 };
 
 #ifdef CONFIG_QCOM_GDSC

-- 
2.45.2


