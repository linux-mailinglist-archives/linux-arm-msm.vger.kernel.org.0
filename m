Return-Path: <linux-arm-msm+bounces-46908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF5A281E9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 03:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82674162C7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 02:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B335211491;
	Wed,  5 Feb 2025 02:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apNNpCr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01121200A3;
	Wed,  5 Feb 2025 02:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738723267; cv=none; b=aD1ITnvNQghtO8+zJzD+zh159UYWLSKWa8XpQBgAsUT9k2b/KNSg8U2ifA/uwjkrENFIiPuilpUft53Cwy2AZfmE/8btdDk6QJus9EqzagThnABzKoSt3A7ObFoB8DqzE2K89OArogiorNFQcvj0vUbQnR18rKxm08v/u6j9bn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738723267; c=relaxed/simple;
	bh=8KHGfVIy6PZ/kQOwVu8+li4ZGBn5wHtCLBclG5gxpZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RD/GuflF25sRIdlzJRfB6WZsTqWk8YbH5Y0yI7P8mitjaniyMgxi/JLoIEELGtzzQ4N70MIZxBeU8NhJsC78OEEtYhhoOIrzTRUyZdbvtIoDvOv9ugVm2LJnOQfdjlJvRc7vti/SOLMugEZEMQp5uk9t8YxqQ6atzBRoeCYC1Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apNNpCr8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f16af1f71so5530465ad.3;
        Tue, 04 Feb 2025 18:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738723265; x=1739328065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4twR9JSRKP16NJKHDkljf0dEGI6XOF41Z0J3Jxda0WY=;
        b=apNNpCr8eMUsUzlN2a68o7vmCtA5w9AyLLMJDASFsr+rw3qLruoM2jYMqIYn7TCVPW
         8CtrcI1wQowXsN7BQPZ+O5EWbEm2iuMLSwpvdmHCkf3g6m+G1IEcWixixQlcEFJR3Va8
         zDaMQMu38YDmd5Sn277Rc96e/zdVsWv5PWj2ipLCsm4UKAozjuWwVtqDI/OdVAiKWdZ3
         P91cqKvbRByDr8nDnfjBj9XH9NKbKofDnmF+4tW7kjI4mXprVFkH1iQu4+PQkx7tY//8
         /BSAoUpPbHqHrT8qlRxAdTG//D4bp93ltTTsfFSsECQluAt2oNeEWRC3PADVnBwwtIhM
         1vdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738723265; x=1739328065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4twR9JSRKP16NJKHDkljf0dEGI6XOF41Z0J3Jxda0WY=;
        b=Uky7dyqwJ0pMficr4mbkahKeCjvl4swmt8hJ2XqFGA9bQ3B/mmBCrJ5W0cuG4xrXpP
         pkx959Wkv4QGWSz2h7czI/ExUZ2UOW6uitT3axyYZR6z+wkf8EY8+XZnmD8XuN7UL9Oe
         CWZWJH9cm5w79l+64kAvmLu2Enq2NmNrFh8mDz+tRqwfqtRxlWcSjazS7giN9QHNVtWx
         UNWBhmiFdahm2IjmP//uGW/NaqhjReC8EBnaWLhz5O85mv9gPUdK1nE6DUbXrhbwv7gt
         tHGl9ed5i7yYmGwZ/yepL3ESkZxlU5B43AAbvPLbhiBfKcFRp7xSh2lJJQtSVfRa6oL3
         mRSA==
X-Forwarded-Encrypted: i=1; AJvYcCW/udsbmvQAQK9JmT5IBWmiMmJsr3IdHeieyIK4Hos0x1KES7Fl77E7PI32IpEhbRRn8QSo7RZQ51Hf@vger.kernel.org, AJvYcCWPqwiZnkgFh+s4yztpvXK3sNV8ahuJyUQm5YjmV/DWII7A4ozuklsNEpOUAgoWLSbydMgWiEe0EMCTDKRI@vger.kernel.org, AJvYcCWTvfxFOx8jy50DzlMkvvXoC32YEBL2xG7mPKU+gU3hD2k6skhHTT/6TK3vACsPR5pR2qFtSTIMiuOc@vger.kernel.org
X-Gm-Message-State: AOJu0YybIgiLajFrX254ORYwsSSuRtetpGDgRwVq2AG0FzmuYgAICE4O
	gxFItVvi/04CobXz9iPojRVO/RvK23tw3EkgRf47bCAxtwcrWLQL
X-Gm-Gg: ASbGncsng0UPOwYzQAhZHV8muxyCVuJPgAzxXh9CVaNXMm8DC/VRfCP3EmVFIcc9SUE
	xnRvN7fnnVapMC5lR7SU1DD8oUXl3as+1ybsVRzkkyaQGQYnxEQ1bFl5E6Xzd1JU8oYYOpyn3R1
	ozTPPh/zSrNCs0cGGXPJcwyy54hh/i46mqCun42zj8CZjEki8hsqS2DxV5l5mUkAXoTmKy03bRd
	+aGRTK6jJsX+gziacdqDfmqaACgJ4/pu4/01q+3HSnYbGi7t+BG46ngfgfzWve7bdD7s0X2Cr1u
	3dkojJDtD7bxEiU=
X-Google-Smtp-Source: AGHT+IHys4xsUz/S+Yv5CD+DsNOj6mj0m+DTH45vx3YlE4Esvw4TgUgeL097Mh2SDR1ToXoDDpMpkQ==
X-Received: by 2002:a05:6a20:cf83:b0:1e0:f495:1bd9 with SMTP id adf61e73a8af0-1ede881ba1emr1949980637.8.1738723264886;
        Tue, 04 Feb 2025 18:41:04 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe856951sm10664577a12.34.2025.02.04.18.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 18:41:03 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 2B46C4208FB6; Wed, 05 Feb 2025 09:41:00 +0700 (WIB)
Date: Wed, 5 Feb 2025 09:40:59 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 8/8] Documentation: tee: Add Qualcomm TEE driver
Message-ID: <Z6LPu7WcRFnSCyAq@archie.me>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
 <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-8-297eacd0d34f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YU5J0YlSYBp99PA5"
Content-Disposition: inline
In-Reply-To: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-8-297eacd0d34f@quicinc.com>


--YU5J0YlSYBp99PA5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 02, 2025 at 06:43:36PM -0800, Amirreza Zarrabi wrote:
> +The QTEE driver offers the qcomtee_object, which represents an object wi=
thin
              "... provides ..."
> +both QTEE and the kernel. To access any service in QTEE, a client needs =
to
> +invoke an instance of this object. Any structure intended to represent a=
 service
> +for export to QTEE should include an instance of qcomtee_object::

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--YU5J0YlSYBp99PA5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ6LPswAKCRD2uYlJVVFO
o0KbAP9BjWgtTT9EraVe8ZUmzZ8MQd4wzzlo4o5ckCFleZ3mSgEAxIECwku5zqqh
UyRE4JypMVgh+6eEDCjJJEOM7BPFvgY=
=Ma8E
-----END PGP SIGNATURE-----

--YU5J0YlSYBp99PA5--

