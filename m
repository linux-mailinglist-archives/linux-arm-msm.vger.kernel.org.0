Return-Path: <linux-arm-msm+bounces-75556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC3DBABA97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 08:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9804481AFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 06:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA9427F01D;
	Tue, 30 Sep 2025 06:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="Ydg8N239"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m21471.qiye.163.com (mail-m21471.qiye.163.com [117.135.214.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC61F21C16A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 06:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759213607; cv=none; b=AHrzzZMSKqZ4tpka6zboU1Lmr3Ijstunp8dr6lnsemLninu4Qy6kLuMfOsbH9YZjtAu89fwO/7QzsS8hDiTCcmPGqt8ADsh6+iq71w0u2cjNc0szh5k/MZRgQ31ClWew4QfzjvGJmBhHgiKpTXk1JjHBYZ89lWxk1Bx+5W6jFW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759213607; c=relaxed/simple;
	bh=KQjKYkLcy1U9aVEu7wPTN+X4FQm8BPVyct9sKWO3xPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQJYL3k3jd8UIdZTq5FJzufGCUsII7taNn5Dc5F2Rkyb3KESaOcXDgMpqKrbsE0zvCahmr1wPP2T4Ry7Qx1R9AIXm4PshhGLOjtWVrBa1i1HwjkFeD5IJQo7Gb3z+Qz/JfvdUHXHBHeJkTGSiF+3D52O9U+/VfrJmKyE3hbcDdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Ydg8N239; arc=none smtp.client-ip=117.135.214.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [113.235.126.201])
	by smtp.qiye.163.com (Hmail) with ESMTP id 248d5921b;
	Tue, 30 Sep 2025 14:26:35 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com
Subject: Re: [PATCH v4 2/2] dt-bindings: arm: qcom: rubikpi3: document rubikpi3 board binding
Date: Tue, 30 Sep 2025 14:26:18 +0800
Message-ID: <20250930062618.264090-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <kui5hmtslrbtvrtdbwvuhjoytmrvwwemn5cuqclflk5nxbcd4a@ajr7iqljnv2f>
References: <kui5hmtslrbtvrtdbwvuhjoytmrvwwemn5cuqclflk5nxbcd4a@ajr7iqljnv2f>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99994d294309d5kunmb185fb443157cf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUkZVktKSEpJTUNKGR4fQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTVVJS0pZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ydg8N239umI8swMr6qeqDarzD5ugmrSam4UEe3CN+YDeHDMb0uAyblmVd7Yb7/Z3v5DSewVs0GpiybBwXIZ4oGjVt785aGiPDRbzB15nvJgXSqZ9Ll9k7JvoDL684HTKfhx7RbAes1iq9UpriqFB0WdVCGHZXCoxO8JT7mtlERc=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=v1VMbOUg95OUfsN/XTJ+MAGdU5yO/7GrjOQ5obYTHaA=;
	h=date:mime-version:subject:message-id:from;

> On Tue, Sep 30, 2025 at 12:32:52PM +0800, Hongyang Zhao wrote:
> > Add binding for the Thundercomm RUBIK Pi 3 board,
> > which is based on the Qualcomm Dragonwing QCS6490 SoC.
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 18b5ed044f9f..763fa2ad2425 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -340,6 +340,7 @@ properties:
> >                - particle,tachyon
> >                - qcom,qcm6490-idp
> >                - qcom,qcs6490-rb3gen2
> > +              - thundercomm,rubikpi3
> >                - shift,otter
> 
> 'shift' < 'thundercomm'
> 
> >            - const: qcom,qcm6490
> >

That's my mistake. Thank you for pointing it out.
I'll wait a few days and make the changes in the new patch.

--
Thanks,
Hongyang

