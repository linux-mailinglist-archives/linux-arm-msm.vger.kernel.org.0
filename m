Return-Path: <linux-arm-msm+bounces-31009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1583B96E227
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 20:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 416C91C224C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 18:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD640187554;
	Thu,  5 Sep 2024 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EV7haNi4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0658821;
	Thu,  5 Sep 2024 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725561709; cv=none; b=CpOsaRnQME3O43aupgAypCrMmoZY/9wN8aQWiJM5w9ICs38OjKPk2rCqjc//vjsZfT9hx4928r5nXHqT4Ht6Uyt2M6MxWhbLLA1IlT671cHNlaMoCe3rMsQ2aqfq7g5iyd2WfAD1q+7U/bqIyJ39c7rJXlSoHgaWKSBxzCstC2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725561709; c=relaxed/simple;
	bh=o9v6tfiHjwh1ItvVQA7QxJ59GhaJ+30hamTD7fOplT8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=SX64OsrArJOD/BSweuzjiJytdNoxL0WmpC53dCb+lSjGjk17chkB1YQ6e9dm2rGbKZyxNPjI0KHAODCWsKgyUAHE69PeUS8mrfNQeNg518cwZUBu+2mEJtT3KpiyT97Os/bQSj2n6C3kSktBIUE/o/52d39hoAWlkJOqRUfAXos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EV7haNi4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33397C4CEC3;
	Thu,  5 Sep 2024 18:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725561709;
	bh=o9v6tfiHjwh1ItvVQA7QxJ59GhaJ+30hamTD7fOplT8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EV7haNi4o6VN3Sv+POQLZunJzxyqb0jbJNFTM36W6Y027zpPGoXAF74Tj/pdZ0kR8
	 H6DRhMJX7kUcHB0b2JnHENE+lb0elboyCMZkE5//ooqk55pvv3VVjwyLBshyB3Ryo+
	 p/YO0LjM9b9lorsPtZRofCZ4OkdMLCfZ0yvd6W00ufrFC++BMziq9owzSvQdjhSQM8
	 o/0rw9CmrGrHqDMNBTQh+QbJFnSJdiMcojyXIOOaaXjUxGKNR8itL7xgsyrPlzIChe
	 SJDoZu89a4didcjg5QZNqTqLMLa7wn+Xw9SgRFWFSi5nyUREgoCtg7mHb2zJJZ5wig
	 v8pDzyseDzcmw==
From: Kalle Valo <kvalo@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,  Dmitry Baryshkov
 <dbaryshkov@gmail.com>,  Johan Hovold <johan@kernel.org>,  Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,  Bjorn Andersson
 <andersson@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,
    ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
References: <20240905122023.47251-1-brgl@bgdev.pl>
	<20240905122023.47251-2-brgl@bgdev.pl>
	<6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
	<CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
	<CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
	<CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
	<d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
Date: Thu, 05 Sep 2024 21:41:44 +0300
In-Reply-To: <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org> (Konrad
	Dybcio's message of "Thu, 5 Sep 2024 15:13:45 +0200")
Message-ID: <87v7zagcyf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Konrad Dybcio <konradybcio@kernel.org> writes:

> On 5.09.2024 3:00 PM, Bartosz Golaszewski wrote:
>> On Thu, Sep 5, 2024 at 2:56=E2=80=AFPM Dmitry Baryshkov <dbaryshkov@gmai=
l.com> wrote:
>>>
>>>>>
>>>>> As you are going to post another revision, please also add
>>>>>
>>>>> qcom,ath11k-calibration-variant
>>>>>
>>>>
>>>> I had it in earlier revisions. The only one we could add here would be
>>>> the one from X13s as QCom has not yet released the data for the CRD.
>>>> Johan and Konrad were against adding this here if it doesn't refer to
>>>> the correct one so I dropped it.
>>>
>>> As Kalle usually merges data with some delay it's not infrequent to
>>> have DTS which names calibration variant, but board-2.bin doesn't have
>>> corresponding data. The driver safely falls back to the data without
>>> variant if it can find it. Als  usually it's us who supply the
>>> calibration name.
>>>
>>=20
>> Johan, Konrad,
>>=20
>> What do you think? Do we know the exact name and should I add it or
>> should we wait until it's in board-2.bin?
>
> If we can agree on the string identifier with Kalle in advance, we can
> add it even before the boardfile drops

There have not been really any naming rules for the variant string, it
just needs to be unique so that it doesn't conflict with other variant
strings. What have you been thinking?

But please Cc the ath11k list for anything ath11k related, adding it
now.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

