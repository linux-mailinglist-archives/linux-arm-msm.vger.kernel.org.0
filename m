Return-Path: <linux-arm-msm+bounces-51810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC49AA67C43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FF737A45BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3231DDC34;
	Tue, 18 Mar 2025 18:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBAd9xai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58031898FB;
	Tue, 18 Mar 2025 18:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742323989; cv=none; b=uU9ltaQ3fO99HP8eaDqIYlEnSDGBOPwUeFFuAix2tUyL1MyFIdRCJ3HJdONLOqS4O5gSWzJh6W+FKAS9GI16ssV2VtEIoE8uyh2by2qYIOnIL2JsyW1eTZqNXRMgSe3snd1CR7H5vDCnH4l86AAfIb2757j2vv8aDLI3SQ/UpJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742323989; c=relaxed/simple;
	bh=hiPvl3h5dqykKKmM6/ouGeW0BQuvJsxF5IOCKZpno9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfGmcnr4NEkRZFpREE3tZsm65qmOs5h2mTy8Rp7QEM0T/kTZ1QlM0KSD/g1cpIk+kRlMJAj2roT9u6Zt2qNglAqiSArBeswnqqawJmVz+aenc0ry6ZvMjQwaFybIkSa95OUif2DXMitCoyB2K7l0R8U6ul2apyJy19Lqb+BmZbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBAd9xai; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso1821945a12.3;
        Tue, 18 Mar 2025 11:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323986; x=1742928786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWQIFqFySy/IfLYoZhnI0jbbYfw0624lPJKYBJtLI3Q=;
        b=PBAd9xaid1+Lha3Hrtt2tLS5vNA75Mi/VgXMcXFWuPxTD+uvYCXTCifQeBnpz/+4s1
         mYdVsQPfq5ez1pw5rWa2D7HH+7GXLPHTK14Vyo6iLbzrbzS8SM2MWCb7jQv8TfoMSJAJ
         G3J/8RnR1j0Odr9drh57u34cM95i2UYAaG3KK+cBJ+ohDzo7Mcbr5F/8SkXvrLW3f80y
         tbOzdrvxQflIPcZ8TnJoYmiHimsZYSqHqhS8tbMrnShTJMYaIaGr0vaoQEAPy7PJxZom
         SvHqdVVvZHE+nOxPJOZF4N/vCrAdRZ0S805F2kpreQ8E8zoKv1fn1FVvjZY5mvUwxR0y
         5O5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323986; x=1742928786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWQIFqFySy/IfLYoZhnI0jbbYfw0624lPJKYBJtLI3Q=;
        b=YruCdV+KKIwMX1AA2bLqnkkp26AzFmHx2dBNM4ppGOFKwhfKFJguE6M0Xuu1msqQoT
         La73eC+CG869CpUA3VO46HR+EZTPxHiDI7ytxMd7AwPkdsOFX2uaa1aqIkjmE/elRpVO
         ihLe3nvQp/2BcSGPHMOu1Vi3qfjWavEPMm4IA2XLeEkMy5Gya3tKhQ6cCgyGLsBUJgeC
         8Itu7TsZHFLhMzJf6647YIS+DpHZkwqiqkn/PgEgIxr2ntdiZ99rucJboz9e/GhugcUb
         0oaUIVBii2c4LA5/ZISYkrVPsEJKFskuhr8e+KCn90WVv4//ky2DExhv/OkUpltwhMtq
         njgw==
X-Forwarded-Encrypted: i=1; AJvYcCUQfCidoMvE7SLgtk4vq8gc3pUczeE3vhgVXmvsWkHThZ00x6xljFxnOOkiNAvigPByRtceTZzraDDtLqK0@vger.kernel.org, AJvYcCWPHE2wn4asYuwHye6OOor2FcCyZTlkRZ9Ga/tzf0KDwjMgpt9M4QwV04k8WZcUrAXPrPkUeRqXLYpFjZJf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8j9vD6H2vFlZFqe5tvruMrh0LAxBXvGzvSlut5M2etyZ1ssBV
	aFf9CfB4XtOpZLsQ0eUEj7onWLGiY5fHkRrlMhVWBuqBdZJIkt/kCkQ6P0DJeGETC6AIZYBzXW1
	R2AgjKiadZynl+LvA4cHYQqYYIGs=
X-Gm-Gg: ASbGncu/oAYuwn6KYL8G7F1lCHWVlctykblnhrJEenAaN81Y7nupImcD62POmkWxXBW
	IG3XFAiwWI/lsyaJcAwxi1sbbIP1dSEHNFhznLdxoqXoi58Hcsp9IKdET4Ic8xK+KjSSYCAcuY3
	Mt8U9gqghnbEIp15EBK9z8ZkpJFnc=
X-Google-Smtp-Source: AGHT+IF3HMeQuFdSa1rMaY2I95QSEZkVa9h37tEZOQ7kmaxIHPwgTnYTGyw+26GvMzhykh7UFEmjoOUoWy6NBQEGFEI=
X-Received: by 2002:a05:6402:b1c:b0:5e5:b388:2a0d with SMTP id
 4fb4d7f45d1cf-5e89f642f5amr15214939a12.15.1742323985585; Tue, 18 Mar 2025
 11:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314085858.39328-1-vignesh.raman@collabora.com> <20250314085858.39328-2-vignesh.raman@collabora.com>
In-Reply-To: <20250314085858.39328-2-vignesh.raman@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Tue, 18 Mar 2025 15:52:53 -0300
X-Gm-Features: AQ5f1JryVWVSZD4bokLEXIuAhpHUWqpv08ifu3W4ADTENE5nPzsfoYNxd0R1AD0
Message-ID: <CAPW4XYZ6+kc+Pj61_Kz8-CEy0Aed92XeXDnUiDAEGNBU+SPxAg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/ci: uprev mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, airlied@gmail.com, 
	simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
	jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 14 de mar. de 2025 =C3=A0s 05:59, Vignesh Raman
<vignesh.raman@collabora.com> escreveu:
>
> LAVA was recently patched [1] with a fix on how parameters are parsed in
> `lava-test-case`, so we don't need to repeat quotes to send the
> arguments properly to it. Uprev mesa to fix this issue.
>
> [1] https://gitlab.com/lava/lava/-/commit/18c9cf79
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/build.sh       | 16 ++++++++--------
>  drivers/gpu/drm/ci/build.yml      |  8 ++++++++
>  drivers/gpu/drm/ci/container.yml  | 24 +++++++++++++++++++++++
>  drivers/gpu/drm/ci/gitlab-ci.yml  | 32 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/ci/image-tags.yml |  4 +++-
>  drivers/gpu/drm/ci/lava-submit.sh |  3 ++-
>  drivers/gpu/drm/ci/test.yml       |  2 +-
>  7 files changed, 77 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 19fe01257ab9..284873e94d8d 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -98,14 +98,14 @@ done
>
>  make ${KERNEL_IMAGE_NAME}
>
> -mkdir -p /lava-files/
> +mkdir -p /kernel/

the folder is not lava specific, correct?

>  for image in ${KERNEL_IMAGE_NAME}; do
> -    cp arch/${KERNEL_ARCH}/boot/${image} /lava-files/.
> +    cp arch/${KERNEL_ARCH}/boot/${image} /kernel/.
>  done
>
>  if [[ -n ${DEVICE_TREES} ]]; then
>      make dtbs
> -    cp ${DEVICE_TREES} /lava-files/.
> +    cp ${DEVICE_TREES} /kernel/.
>  fi
>
>  make modules
> @@ -121,11 +121,11 @@ if [[ ${DEBIAN_ARCH} =3D "arm64" ]]; then
>          -d arch/arm64/boot/Image.lzma \
>          -C lzma\
>          -b arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb \
> -        /lava-files/cheza-kernel
> +        /kernel/cheza-kernel
>      KERNEL_IMAGE_NAME+=3D" cheza-kernel"
>
>      # Make a gzipped copy of the Image for db410c.
> -    gzip -k /lava-files/Image
> +    gzip -k /kernel/Image
>      KERNEL_IMAGE_NAME+=3D" Image.gz"
>  fi
>
> @@ -139,7 +139,7 @@ cp -rfv drivers/gpu/drm/ci/* install/.
>  . .gitlab-ci/container/container_post_build.sh
>
>  if [[ "$UPLOAD_TO_MINIO" =3D "1" ]]; then
> -    xz -7 -c -T${FDO_CI_CONCURRENT:-4} vmlinux > /lava-files/vmlinux.xz
> +    xz -7 -c -T${FDO_CI_CONCURRENT:-4} vmlinux > /kernel/vmlinux.xz
>      FILES_TO_UPLOAD=3D"$KERNEL_IMAGE_NAME vmlinux.xz"
>
>      if [[ -n $DEVICE_TREES ]]; then
> @@ -148,7 +148,7 @@ if [[ "$UPLOAD_TO_MINIO" =3D "1" ]]; then
>
>      ls -l "${S3_JWT_FILE}"
>      for f in $FILES_TO_UPLOAD; do
> -        ci-fairy s3cp --token-file "${S3_JWT_FILE}" /lava-files/$f \
> +        ci-fairy s3cp --token-file "${S3_JWT_FILE}" /kernel/$f \
>                  https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/$f
>      done
>
> @@ -165,7 +165,7 @@ ln -s common artifacts/install/ci-common
>  cp .config artifacts/${CI_JOB_NAME}_config
>
>  for image in ${KERNEL_IMAGE_NAME}; do
> -    cp /lava-files/$image artifacts/install/.
> +    cp /kernel/$image artifacts/install/.
>  done
>
>  tar -C artifacts -cf artifacts/install.tar install
> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> index 6c0dc10b547c..8eb56ebcf4aa 100644
> --- a/drivers/gpu/drm/ci/build.yml
> +++ b/drivers/gpu/drm/ci/build.yml
> @@ -143,6 +143,10 @@ debian-arm64-release:
>    rules:
>      - when: never
>
> +debian-arm64-ubsan:
> +  rules:
> +    - when: never
> +
>  debian-build-testing:
>    rules:
>      - when: never
> @@ -183,6 +187,10 @@ debian-testing-msan:
>    rules:
>      - when: never
>
> +debian-testing-ubsan:
> +  rules:
> +    - when: never
> +
>  debian-vulkan:
>    rules:
>      - when: never
> diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/contai=
ner.yml
> index 07dc13ff865d..56c95c2f91ae 100644
> --- a/drivers/gpu/drm/ci/container.yml
> +++ b/drivers/gpu/drm/ci/container.yml
> @@ -24,6 +24,18 @@ alpine/x86_64_build:
>    rules:
>      - when: never
>
> +debian/arm32_test-base:
> +  rules:
> +    - when: never
> +
> +debian/arm32_test-gl:
> +  rules:
> +    - when: never
> +
> +debian/arm32_test-vk:
> +  rules:
> +    - when: never
> +
>  debian/arm64_test-gl:
>    rules:
>      - when: never
> @@ -32,6 +44,10 @@ debian/arm64_test-vk:
>    rules:
>      - when: never
>
> +debian/baremetal_arm32_test:
> +  rules:
> +    - when: never
> +
>  debian/ppc64el_build:
>    rules:
>      - when: never
> @@ -40,6 +56,14 @@ debian/s390x_build:
>    rules:
>      - when: never
>
> +debian/x86_32_build:
> +  rules:
> +    - when: never
> +
> +debian/x86_64_test-android:
> +  rules:
> +    - when: never
> +
>  debian/x86_64_test-vk:
>    rules:
>      - when: never
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab=
-ci.yml
> index b06b9e7d3d09..55b540c4cf92 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -1,6 +1,6 @@
>  variables:
>    DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
> -  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 7d3062470f3ccc6cb40540e772e902c7=
e2248024
> +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 82ab58f6c6f94fa80ca7e1615146f083=
56e3ba69
>
>    UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
>    TARGET_BRANCH: drm-next
> @@ -187,6 +187,36 @@ stages:
>      - when: manual
>
>
> +# Repeat of the above but with `when: on_success` replaced with
> +# `when: delayed` + `start_in:`, for build-only jobs.
> +# Note: make sure the branches in this list are the same as in
> +# `.container+build-rules` above.
> +.build-only-delayed-rules:
> +  rules:
> +    - !reference [.common-rules, rules]
> +    # Run when re-enabling a disabled farm, but not when disabling it
> +    - !reference [.disable-farm-mr-rules, rules]
> +    # Never run immediately after merging, as we just ran everything
> +    - !reference [.never-post-merge-rules, rules]
> +    # Build everything in merge pipelines
> +    - if: *is-merge-attempt
> +      when: delayed
> +      start_in: &build-delay 5 minutes
> +    # Same as above, but for pre-merge pipelines
> +    - if: *is-pre-merge
> +      when: manual
> +    # Build everything after someone bypassed the CI
> +    - if: *is-direct-push
> +      when: manual
> +    # Build everything in scheduled pipelines
> +    - if: *is-scheduled-pipeline
> +      when: delayed
> +      start_in: *build-delay
> +    # Allow building everything in fork pipelines, but build nothing unl=
ess
> +    # manually triggered
> +    - when: manual
> +

Do you think we could avoid repeating code by using anchor (&) and
reference (*) ?

https://docs.gitlab.com/ci/yaml/yaml_optimization/#yaml-anchors-for-scripts

Regards,
Helen

> +
>  .ci-deqp-artifacts:
>    artifacts:
>      name: "${CI_PROJECT_NAME}_${CI_JOB_NAME}"
> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image=
-tags.yml
> index 20049f3626b2..c04ba0e69935 100644
> --- a/drivers/gpu/drm/ci/image-tags.yml
> +++ b/drivers/gpu/drm/ci/image-tags.yml
> @@ -1,5 +1,5 @@
>  variables:
> -   CONTAINER_TAG: "20250204-mesa-uprev"
> +   CONTAINER_TAG: "20250307-mesa-uprev"
>     DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
>     DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>
> @@ -20,3 +20,5 @@ variables:
>     DEBIAN_PYUTILS_TAG: "${CONTAINER_TAG}"
>
>     ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
> +
> +   CONDITIONAL_BUILD_ANGLE_TAG: fec96cc945650c5fe9f7188cabe80d8a
> diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-=
submit.sh
> index 6e5ac51e8c0a..f22720359b33 100755
> --- a/drivers/gpu/drm/ci/lava-submit.sh
> +++ b/drivers/gpu/drm/ci/lava-submit.sh
> @@ -48,7 +48,8 @@ ROOTFS_URL=3D"$(get_path_to_artifact lava-rootfs.tar.zs=
t)"
>  rm -rf results
>  mkdir -p results/job-rootfs-overlay/
>
> -artifacts/ci-common/generate-env.sh > results/job-rootfs-overlay/set-job=
-env-vars.sh
> +artifacts/ci-common/export-gitlab-job-env-for-dut.sh \
> +    > results/job-rootfs-overlay/set-job-env-vars.sh
>  cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/
>  cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index dbc4ff50d8ff..84a25f0e783b 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -112,7 +112,7 @@
>      - kvm
>    script:
>      - ln -sf $CI_PROJECT_DIR/install /install
> -    - mv install/bzImage /lava-files/bzImage
> +    - mv install/bzImage /kernel/bzImage
>      - mkdir -p /lib/modules
>      - install/crosvm-runner.sh install/igt_runner.sh
>    needs:
> --
> 2.47.2
>


--=20
Helen Koike

