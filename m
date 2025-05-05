Return-Path: <linux-arm-msm+bounces-56778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05877AA9282
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 13:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB56B3B6BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64578207E03;
	Mon,  5 May 2025 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBaK1A2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5F8207A22;
	Mon,  5 May 2025 11:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446201; cv=none; b=ARl/qwrINjgeqHpAPcBANifFlhHILrt0YJTwKbcM9pc2WLx+LF7UDQnwl/692src7vx2BIUxa4AjWjDr2+dkm4QJ1QUVCBHRqx8W8ADgR+OkQ11Xoc4t5wy6rmRQc3CldBjm3ix2HydX93T4J3+2aaA6rshoFYu9k0BYxZCOcqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446201; c=relaxed/simple;
	bh=bhylBd3wO/oU3H4pz2cS+C+DeqobvL/gAITFSoI+DlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vc2qFLekhMKrlCJIYvbLK/HoeKFquS9NfgSNyE7ux1ckSEGAAvOq0M3Dd7zJ77enxwxX8Q1IykFcR/9g1DXgKVYtl7MwHlVY6fp1zZWtCcGgTo+MBoIPzpgViRbZyHJoR3qdQyNwoaYinXudsrzkUFLEZQbxrwLc660udWRMCz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBaK1A2A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2700C4CEF8;
	Mon,  5 May 2025 11:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746446200;
	bh=bhylBd3wO/oU3H4pz2cS+C+DeqobvL/gAITFSoI+DlI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OBaK1A2ACY5mLHZc1RwNmwdp3qGVhRPpfBpIBc11MpDdTgvZjzJh9c2HqD1j/xbtF
	 IE3axwUzyoBNXJJ9wLAZrwk/C5ae9vmLf+t52fKUMymHOy8rLX7A/TqYZDsgIjmxJO
	 uqRWlNO0+YLXrPDFvUm39DtT/cGgYkARn3xxiCBrZ2IsI7xVrutO9LTBggxr7tyo3O
	 Ew0kuk3bVIOPSA41viB1pvME5VT2HftocjkLZGxd/CD0ih9duJtfPjYxm7uyH2I3Y+
	 LWBUIscuFZsWPeiYe6cTPw8irWThpkd0fbUAw29CUnAaOBvzQ70iM6xL28Uvz7HSBp
	 JM6Z0txoM6w3w==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso707186766b.3;
        Mon, 05 May 2025 04:56:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTFcjz+64Ufa9ld+mJWPz4ZP23wwQhQRSuMVJBrJEFBJsidUVhK2GPyTA/cvwpuAxfS1PczngsEB5I@vger.kernel.org, AJvYcCV2ZJARJ4G8qfHHI9OGqX5+NU5HSVUiWy1Mpuyc9Sqk22QJ7Pqztm1W73m8udeUaeBDAVSGcpVk4NH1AdH51w==@vger.kernel.org, AJvYcCVZMGS8qzdTOz/Ztuvhmmn70/O1oDdJGiWXBFYE8F3kC0PuF1XNFmqorSa3lt0bJgNU6bPZMIzm0+CpAD+I@vger.kernel.org, AJvYcCWhGxdjcXl5JOzOinZfjBe2XupEx1MB4j7M9zEPmuBpErjY/Z3DAQzs2X3AD+kbfgEJKx/Zq0AVrdVQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywymy223P+fB/MSfBZ9EKdFWR6M0JmRYkROn7QO7eHrevoOEATD
	PKfZuN7erSSBBdGwTeycubyWBwdt2hdZSKd4D3nnnRmk1ehUv1+yMWc30zQf/alRGQrrZT9SmgS
	MuK+6xl8bcFy29XYXFfXqW0WYPg==
X-Google-Smtp-Source: AGHT+IFS+UYRYhqu0qLApsmsVcQPU5PxbnUTRMgU4A8cLFv9VbzJgVSFzBJ4TlrMHVGbrQpwwBTff7ATCPn82nTV/yU=
X-Received: by 2002:a17:907:97c7:b0:aca:d52d:b59b with SMTP id
 a640c23a62f3a-ad19084ec5fmr805337566b.47.1746446199152; Mon, 05 May 2025
 04:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
In-Reply-To: <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 May 2025 06:56:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
X-Gm-Features: ATxdqUFnhjeEjXeL57DSByQBGcanFON-MWfWdUb7FuuvpsF2gYXLeAeEkshoH0k
Message-ID: <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rohit Agarwal <quic_rohiagar@quicinc.com>, Kyle Deng <quic_chunkaid@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 11:13=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
>
> On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
> > A set of not quite related bindings warnings fixes.
> >
> >
>
> Applied, thanks!
>
> [02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc =
path
>         https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a

And now there's a warning in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/q=
com,sm8350-mdss.example.dtb:
display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names:
['mdp0-mem', 'mdp1-mem'] is too short
        from schema $id:
http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/q=
com,sm8350-mdss.example.dtb:
display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects:
[[4294967295, 7, 0, 4294967295, 1, 0], [4294967295, 8, 0, 4294967295,
1, 0]] is too short
        from schema $id:
http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

