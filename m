Return-Path: <linux-arm-msm+bounces-32488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D098608A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 16:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 203491C265C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 14:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5174B1AC439;
	Wed, 25 Sep 2024 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGr41tm3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFBE18C003
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727269735; cv=none; b=lS+a4IGoy+i359S83XCCC0y3IYKUjVOkaoqGYj/7kvbQpNv4cQc7Y6nrp7t/2kPC0QDxfNl9QjANRe0yDDBsmANA9cTXF51Ix6TlUN9sIG9xeB/rehTaMsTwM9SpktO4VigpUJLQTb3YLYAEcWlVhR3SVoX1aJZ1umEr9XECb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727269735; c=relaxed/simple;
	bh=WR5AnzJF93Qx9LVa6e4GL1bUJ/gZyTq7uc9OMyhdOFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPWqTMoSRbKsbqIqJrUTD5VmaX5g7oc4ZdEPF0ILq0ZD8j+1T+ophSbRbOzWGa/CLuTudFo8cFR3nJSNJ4VvRzNhmm2sHZrM3Nslt+qXnr0KxmPDXrJI0BV1vbDYeej++A9UX0KqFF9rGfK2zgsU57ROlR79CY8j0Hu4oNs/jhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QGr41tm3; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-536748c7e9aso1365032e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 06:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727269732; x=1727874532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GfIe+0A9/iwZ9+ASBT3gHE6aur04dE6S65bt24Jbj2A=;
        b=QGr41tm36dzqyVeTbv90aKDJ+Vv+51ygVKoY5PPZNEKFrEelKv2w9e67Bu7Z83diPI
         1B9xYoJaHzSSmnfDr6nGMgQadeog+YKlS2rXeV+OpCkpAwTUP6eZJPOrIzi/ZC4bH5lh
         q3uBzQ8eMBLLd+ohjNIqTrpRP3HYyZ2xCagTQrfmmnOfE7KmVRInuycVHL/cdYrJe4Ov
         eQkx+lcZF41ZJBpR3QBLUIRE9xcVYzZ52MfkM4BzMHcqFQTPFLgSxpC8y7jZ6kGfksu9
         JhEe3r7yKYNTxEoQTKEaU4SF+iPNNZQZU2RfXuy94gVbQNUka2C9utTuCfImtWPDs0JK
         97Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727269732; x=1727874532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfIe+0A9/iwZ9+ASBT3gHE6aur04dE6S65bt24Jbj2A=;
        b=q+hKOYamKcclUt8VOvdfWMe6kmZT9bNg5N3jDWj/k8S91f5Q7ig0kUnpxbGMmTXoLD
         Bkt8pePq1Cu2a52T200V8MPfH/tfL50eksu64TsPgAiPobGp4i7raMuH5AEVoTmelKsW
         /w+Z8B3YTETmzEANJ00mS/2Eazo5Fn8WcrIsQEmTUXZvRnKrgnYjuG0I9aldiHgMeUl4
         rz9MvYeL5uQAJt/+TqPswH6VpMDED4tWSZ+bXuhYSngNjmswbUjTBNqezK16ud4a2nqI
         7i3EDaaCXO7tUaTACPRxM0IqQFFnpwoj33p5hSOmUls80HgsM3a18Rotk5PQ9a9aIFdg
         +Evw==
X-Forwarded-Encrypted: i=1; AJvYcCWV8rNsXAlmc2V9/rXH8KNkgFuYx/2GaV+0M61SbJGWUMlr8e1vnvZ1jndPTcqxXzI0C13Dcg11UbUyL5A2@vger.kernel.org
X-Gm-Message-State: AOJu0YzTQd2erGVnlBfOgtn9l3zqv3//Faguc6wqGCOSxp6qZwTnrKen
	QMKv50ufFGo7as4BhNjiFxlT5jZeXLeh9DYQqt67k3txp0Df9xYIgzyJj1w8F4s=
X-Google-Smtp-Source: AGHT+IGDlc38qNmQApA7G1CZmAUwKPhj6Dzr+UVWgNKV7XNIVs+fN9df6yglg61dDNAhSR3WZLlEBw==
X-Received: by 2002:a05:6512:1313:b0:536:568f:c5ed with SMTP id 2adb3069b0e04-53873455efemr1670045e87.1.1727269731620;
        Wed, 25 Sep 2024 06:08:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8640abasm519642e87.177.2024.09.25.06.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:08:50 -0700 (PDT)
Date: Wed, 25 Sep 2024 16:08:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable wifi for
 qcs6490-rb3gen2 boards
Message-ID: <v2bgxmp6khrrxnpzgwcow6dymwzdil7yfjt7xwnq5xmgda4gor@vt3cj4jgwylu>
References: <20240925090650.26314-1-quic_bpothuno@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925090650.26314-1-quic_bpothuno@quicinc.com>

On Wed, Sep 25, 2024 at 02:36:50PM GMT, Balaji Pothunoori wrote:
> Enable the 'wifi' node for qcs6490-rb3gen2 boards.
> 
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
>  1 file changed, 1 insertion(+)


Please take a look at the mailing list ([1]) before posting.

[1] https://lore.kernel.org/linux-arm-msm/20240907-rb3g2-fixes-v1-4-eb9da98e9f80@linaro.org/

> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 0d45662b8028..21bcfcdb5e46 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -792,6 +792,7 @@
>  
>  &wifi {
>  	memory-region = <&wlan_fw_mem>;
> +	status = "okay";
>  };
>  
>  /* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

