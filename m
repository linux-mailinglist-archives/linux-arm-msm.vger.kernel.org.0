Return-Path: <linux-arm-msm+bounces-12764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8736C869E90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 19:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75972B29978
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 18:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82EB146015;
	Tue, 27 Feb 2024 18:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fs68vk9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4EA145329
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 18:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709056944; cv=none; b=EtWUV8xLnL0JMwLageFe/xlgXRvxfiwgAD9k9+WQTJ6NHhK7VhA5HLkXm1wph5cmpDwyAVbuVS7nVbXWFi/xAo6yPqJOQyvQzrTsRWO03Rd4/7Qn6VYBP5x2VgOtjMVfTsC8WFv23VL7yoz1ubi/vvAV6B5NptwUsNdYkcMcz9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709056944; c=relaxed/simple;
	bh=9srZA86tRQ0Lc6f+G5Z/wjNPWsbOftV358BYgV3yd4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4WTT/id6vge8Tz1hhV9Itk4ZD2faAQrJj7P2wE5oJq96WMh0YadZTus26FaimGfcJ/mWTEKJgYgjfn7NLurX+bjafxJF974A8NtfvwQ0DPImR7y2WqpWfLo6he1t+bWFpJ0stvyj84w3K0vg5DFQjkukAKbrLPFgpzoiB6Jocg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fs68vk9L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709056942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RxNc/aFVnNDKr6nzABJwfQofcGO3o2pWudIkQ0RdBpM=;
	b=fs68vk9Lm8BbupZrhnYme4V3mRSXdnm+4Q+3I/3Zlk3MorDY9QVbyAtaG9yyfzoaF1iHmD
	UBmtpSzyLJVGpCnpHNV4K/Le7O4yLUlCKmkBbbO3vMEtMwaC2TVq5Z6yPtaBTkolUtze3w
	PZ8eWAxbsptJ4D0MAuBwPqIZtdaXXAw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-7Cy-09V7NoG_AanXkwHm5g-1; Tue, 27 Feb 2024 13:02:18 -0500
X-MC-Unique: 7Cy-09V7NoG_AanXkwHm5g-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42c7a807fd0so47740691cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 10:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709056937; x=1709661737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxNc/aFVnNDKr6nzABJwfQofcGO3o2pWudIkQ0RdBpM=;
        b=O+9J6Jc//3xTWHIvGaZK/pBGKAe2P+82Q52Pk2AfXP1ZGlrJM1Er61a2pAAhj2G0Iw
         KhyhvFbbtSfiiNH5TokIAvyJ7IFK9SBPJPvemY8GTn3v5jH2e8fEiZn4XuHFH+cC8NR2
         gcfkUQ5QXmum7njN6B96Egm5uZvd5+6BPk+MZhpSzOfLO/bV3UTKN0yhoBjhgyoM5Ns/
         pBKrkbWJ4qZRJyZXvA37U6sfi+Co++DBJpPh2wIR87Bh3s2Qg2fEDNtJodgBYpNoBccB
         4+fCa4nD/gbKMMSpsCgfS2y8OwbPpBBO76mQLHpV5hvQlHD1wxf9EfAeSEEeNPK50vw7
         HERw==
X-Forwarded-Encrypted: i=1; AJvYcCVlBjIVV1IVTslqjN3FU5bFyZ7tJIpSSoTXga2kG3BBTznJ2dWnAXJMOafL4Cs11cwuLv5xOJJO3hlf/oVGY9vBol8I6gma2ZV//BCA0w==
X-Gm-Message-State: AOJu0Yxgm7U1D/Ih0HxqwniEuduVnUsI8wEDZQeOTu5hnVg4zFqe7Pt6
	GJzPewJHEsqioknKzOubktWZtAlmmBnKvBaORl01nnqboYR21U5KXR34k652RnJcC5itnEfJVAR
	lr5yF3qp4lIuk+QNwT+tPt5iiawrMtrX7oky+2/mDSeWNn9+8EEcGiQ/iBuKF4on9NYyvCwY=
X-Received: by 2002:a05:622a:1a97:b0:42e:a717:cbca with SMTP id s23-20020a05622a1a9700b0042ea717cbcamr802358qtc.41.1709056936783;
        Tue, 27 Feb 2024 10:02:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdFPNupQsoGCNMoyarnVyVV+samDOQcNLB9zEJi7UDBBSyn6KQpoOrEG/VbkkBYeBv36V0Uw==
X-Received: by 2002:a05:622a:1a97:b0:42e:a717:cbca with SMTP id s23-20020a05622a1a9700b0042ea717cbcamr802291qtc.41.1709056936129;
        Tue, 27 Feb 2024 10:02:16 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id f12-20020a05622a1a0c00b0042c7b9abef7sm3766020qtb.96.2024.02.27.10.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 10:02:15 -0800 (PST)
Date: Tue, 27 Feb 2024 12:02:13 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sarosh Hasan <quic_sarohasa@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Prasad Sodagudi <psodagud@quicinc.com>, 
	Rob Herring <robh@kernel.org>, kernel@quicinc.com, Sneh Shah <quic_snehshah@quicinc.com>, 
	Suraj Jaiswal <quic_jsuraj@quicinc.com>
Subject: Re: [PATCH net-next v2] net: stmmac: dwmac-qcom-ethqos: Update link
 clock rate only for RGMII
Message-ID: <3refwt5x2xplibxkne5sae4ybic7inzmfwna4vkhprpf3nyqom@lwng6mkbe3gc>
References: <20240226094226.14276-1-quic_sarohasa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226094226.14276-1-quic_sarohasa@quicinc.com>

On Mon, Feb 26, 2024 at 03:12:26PM +0530, Sarosh Hasan wrote:
> Updating link clock rate for different speeds is only needed when
> using RGMII, as that mode requires changing clock speed when the link
> speed changes. Let's restrict updating the link clock speed in
> ethqos_update_link_clk() to just RGMII. Other modes such as SGMII
> only need to enable the link clock (which is already done in probe).
> 
> Signed-off-by: Sarosh Hasan <quic_sarohasa@quicinc.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

> ---
> v2 changelog:
> - Addressed Konrad Dybcio comment on optimizing the patch
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 31631e3f89d0..c182294a6515 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -169,6 +169,9 @@ static void rgmii_dump(void *priv)
>  static void
>  ethqos_update_link_clk(struct qcom_ethqos *ethqos, unsigned int speed)
>  {
> +	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
> +		return;
> +
>  	switch (speed) {
>  	case SPEED_1000:
>  		ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
> -- 
> 2.17.1
> 


