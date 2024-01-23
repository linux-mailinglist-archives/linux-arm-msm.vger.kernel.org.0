Return-Path: <linux-arm-msm+bounces-7875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8402837E5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 02:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77C53284DAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 01:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899E35B5B0;
	Tue, 23 Jan 2024 00:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gRKkcWqI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A15A78C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 00:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705970532; cv=none; b=jg5k0R/ZKcH5p8cvSJ+/ttN/dje4zpxuHaV/9F00jX6ibS2vwlemteeqyfHESYaZEGvb0n4oaL4rmealOq65UOk6Z7fRC3YDHyMGAdbAY/c4SJpKy1TbiD29CnnQuqKKb0ptWLZ7mZwj/ZMfakgq39k0pcBz3JBsNnKlUW9u8lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705970532; c=relaxed/simple;
	bh=VwqPrgd7nmKKcnkfxOGYkntoCNKE7mk8oKhqWaSqltQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anqxJJR41Ku9xCkSthe+DXAe1nymc93vcX3yZX2Ym9XRBnt2U93ArdgT3AQ11jDBTJ/5pumYvvX1ub33EUvrg326fZMGVXfSzVlgTVjw0dX1/tnz+lzRNB4B+KbeHnGq1O9hsC1o2c7I0CEly8DN7J6uTlGIEyrpD9rvECz6lFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gRKkcWqI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705970530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwqPrgd7nmKKcnkfxOGYkntoCNKE7mk8oKhqWaSqltQ=;
	b=gRKkcWqINTz+M7liNaA0WCjxKPBOBHRpK3CzFVHfeBOKfIGjf4l9vvI+SRr7Ubs3nL3sBh
	xRr//KySmZFPqkIaM1BIsZJJBbmLVO7cq1cc1sPQ7JGcAzhg0dgraq19cuCDLQYmrWHJUZ
	r1HSpshMPeHRNgRSC4tC6AgDXfTv2io=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-lR-D4-94OiC4Un0GYnNHGg-1; Mon, 22 Jan 2024 19:42:08 -0500
X-MC-Unique: lR-D4-94OiC4Un0GYnNHGg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2c3da4b4a2so210231966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 16:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705970527; x=1706575327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwqPrgd7nmKKcnkfxOGYkntoCNKE7mk8oKhqWaSqltQ=;
        b=k2GM7wsM9gIcII5hrNtq9rEb1ZSVlZPzMyT6QOz4M2IDXi4X9rVB4szzL572RB1asG
         iES6E6d73vD/jALmdITVLfyJ/O09XCjUUj9YCpJuQrgg9EBSQ2BeiwXQMqkYBqHNs5Ia
         jobvuaIFKSjZTwUef5t0t9LsgL0irRZOkXd81b2McP7MiG+fNgB6MZxEIrDVkpBAADYk
         wp9xo4E8lBPyWVHoS7cmSCQ6zghKb2SxOVb8v5HRVTYGQNbHoUMEk4DnEfE3M0IPBxWx
         235IvxB8Xb6qRnPII6HiBvEW0w7nsp0fRfw60MOjLQrblq6lZtgokSiCxBLAFDKBROvk
         Zkag==
X-Gm-Message-State: AOJu0YwO8ecOZAJak94MXKmPJfJzmYqkn7Bem7ppRMjhxgqUMUpCFQcM
	OPEps/VPZidwjVaGrKVuTWOGivRtQD09bcp20qR6rttWhDtWQ0zxgSN7k9h0hyEXlsa/H0Iqt0C
	xXPJ+LaLe7wrFIJgfVFZnQi4zLvRQ22JO/LgUMUAZfPkjTUxqprnt/sgdq+674PWA9rccNsQ0bn
	B/47Rwq7p5NDnRfitHD4N2XaaLkBogIi0hq1ChnQ==
X-Received: by 2002:a17:907:a78c:b0:a30:b9e8:9951 with SMTP id vx12-20020a170907a78c00b00a30b9e89951mr84105ejc.141.1705970527517;
        Mon, 22 Jan 2024 16:42:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjpacoFjg2DlSHZrk9JiIB3fJNxgkIz5ULmHAQ+wUjzqKB3Xe0itHbAKRFNCNd0aoWKIw9daVwqJitUFlTFDA=
X-Received: by 2002:a17:907:a78c:b0:a30:b9e8:9951 with SMTP id
 vx12-20020a170907a78c00b00a30b9e89951mr84091ejc.141.1705970527255; Mon, 22
 Jan 2024 16:42:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld>
 <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com> <CAA8EJppLNFReZn1HK_radSkKkf5L584fx3FCuqG0FoUt4+H=nw@mail.gmail.com>
 <Za5xj8S3Gs7N-UUc@x1> <20240122200237.GB2936378@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20240122200237.GB2936378@hu-bjorande-lv.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 22 Jan 2024 19:41:32 -0500
Message-ID: <CABx5tq+pXi8uqk-GUwej-E_gVhQv-MO7VSnexQ2rq7aEE4ZiRA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to SA8775P
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Eric Chanudet <echanude@redhat.com>, 
	Ninad Naik <quic_ninanaik@quicinc.com>, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_psodagud@quicinc.com, quic_kprasan@quicinc.com, quic_ymg@quicinc.com, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 3:02=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
> The problem I have with the patch is that I don't know which precedence
> it sets, because the commit message indicates that we have a new
> firmware version, while Eric's report lacks this information.
>
> As long as everyone with access to the hardware agrees that breaking
> backwards compatibility is the right thing to do, I'm not against it.
>
> But then again, if the support is under active development, why would
> anyone run a stable@ kernel on this thing?

Good point about the stable@ tag. This can go in the normal route then.

Brian


