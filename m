Return-Path: <linux-arm-msm+bounces-31285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A097169A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C04EE1C22FC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922B81B7900;
	Mon,  9 Sep 2024 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llMRU4jB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B71A1B5820;
	Mon,  9 Sep 2024 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725880744; cv=none; b=OGdKfTZVGgqV66sFDwEuskw8D//EcqDXwCoOv16eeI0PJQ1k1O8yTCyybwNjtAUIiEg5C6XAXfDp2V+1qDsZ+jzPG/awo3EflHeffdD7OXXdjuec3KGI2hcDV0IVvRRF+yRKlHa9WSvEyO6VY5JH0AvKZ+vKIqVFZ4OBUBTrowQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725880744; c=relaxed/simple;
	bh=fizaTSEXyuljg6z99BiS3/Mrs+MIVr7UUib2+wXCqrI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=ERuD8M8l/aByKfSyUqDoABzAbSprDFEMloWRxVxwazlNOAGROR/Pm9WkL3HzMe8g6AkrLDbSNlCkvbONFh7dbqljBfa9S6HsNdZUSbQgWJuGXTT0yx9Fz/E2R1uRTvCSRpGf0lBe2wQklNx8kpPWsOA1/Ncxy9U4BEZqPLbV42E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llMRU4jB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F4BC4CEC5;
	Mon,  9 Sep 2024 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725880743;
	bh=fizaTSEXyuljg6z99BiS3/Mrs+MIVr7UUib2+wXCqrI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=llMRU4jBH0AM1JdyNXEFRiRfhyjHedUj/nkSh699MZuJ3A/blM8Vsm2qf3DZrzIz+
	 OHQJUh+l9E798zfPbXgRbT5koeL5Z0FEVfUk41otCyKI4nWEKNkyPabVpcCgohK2nq
	 6rMBtYFYAr/l/EK/sJglmJssL8J2gQQwPJEDSoAt0Bh/5NZMND4GdtJQchi/Ue9TxE
	 J5xy5q7X5FJ0aS+FqUxXpAgurHlYYiRUE944dR+SVE+3pMBsWmttqnkFVGY0pxPW+W
	 aErRF1PNM2HhvRHA6jNcW00VCmAE8+I8ghfIL8NOUMYrFhpuPRNIbvp+86C3lkhVAA
	 rSnG1DcI3vWQg==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Dmitry Baryshkov <dbaryshkov@gmail.com>,  Johan
 Hovold <johan@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>,  ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
References: <20240905122023.47251-1-brgl@bgdev.pl>
	<20240905122023.47251-2-brgl@bgdev.pl>
	<6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
	<CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
	<CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
	<CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
	<d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
	<87v7zagcyf.fsf@kernel.org>
	<ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
	<CAMRc=Mfj3gpgV0N__oB8kF5pk4PrDwP1CqeUgUbvTwyo7p=7bQ@mail.gmail.com>
	<CAA8EJppi5Zy82=ZUZ67DW-40Qm7aMerNLu_Mzh3HiUBWqPiHVw@mail.gmail.com>
	<CAMRc=Mf--M9d-awzQcs=W8frBwNfkjyvyCrmHAc3MofQo-qp1Q@mail.gmail.com>
Date: Mon, 09 Sep 2024 14:18:58 +0300
In-Reply-To: <CAMRc=Mf--M9d-awzQcs=W8frBwNfkjyvyCrmHAc3MofQo-qp1Q@mail.gmail.com>
	(Bartosz Golaszewski's message of "Fri, 6 Sep 2024 11:45:39 +0200")
Message-ID: <875xr5gjml.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> On Fri, Sep 6, 2024 at 11:37=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>
>>
>> On Fri, 6 Sept 2024 at 10:45, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> >
>> > On Thu, Sep 5, 2024 at 9:26=E2=80=AFPM Dmitry Baryshkov
>> > <dmitry.baryshkov@linaro.org> wrote:
>> > >
>> > > QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (follo=
wing
>> > > marketing name). Or maybe QTI_ instead of QC_. WDYT?
>> > >
>> >
>> > Is there any central authority listing these names? Or are they just
>> > agreed upon on the mailing list? I honestly don't know where they come
>> > from.
>>
>> I think on ath12k these names come from ACPI tables. On all previous
>> devices it is just being agreed upon. Kalle is the central authority.
>>
>
> Kalle: is "QC_8280XP_CRD" fine for you for a board called sc8280xp-crd?

Yes.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

